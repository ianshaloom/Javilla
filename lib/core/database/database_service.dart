import 'package:mysql1/mysql1.dart';
import '../constants/app_constants.dart';

class DatabaseService {
  static DatabaseService? _instance;
  MySqlConnection? _connection; // retained for backward compatibility with close()

  // Private constructor for singleton pattern
  DatabaseService._internal();

  // Factory constructor to return singleton instance
  factory DatabaseService() {
    _instance ??= DatabaseService._internal();
    return _instance!;
  }

  // Legacy: Get (and cache) database connection - no longer used by query/execute.
  // We keep this to avoid breaking any external callers that might have relied on it.
  Future<MySqlConnection> get connection async {
    if (_connection == null) {
      await _connect();
    }
    return _connection!;
  }

  // Legacy: Establish database connection - not used by query/execute anymore.
  Future<void> _connect() async {
    try {
      final settings = _buildSettings();
      _connection = await MySqlConnection.connect(settings);
      // ignore: avoid_print
      print('Database connected successfully');
    } catch (e) {
      // ignore: avoid_print
      print('Database connection failed: $e');
      rethrow;
    }
  }

  // Build connection settings from AppConstants
  ConnectionSettings _buildSettings() {
    return ConnectionSettings(
      host: AppConstants.dbHost,
      port: AppConstants.dbPort,
      user: AppConstants.dbUsername,
      password: AppConstants.dbPassword,
      db: AppConstants.dbName,
    );
  }

  // Core helper: open a short-lived connection, run action, then close.
  Future<T> _withConnection<T>(Future<T> Function(MySqlConnection conn) action) async {
    final settings = _buildSettings();
    final conn = await MySqlConnection.connect(settings);
    try {
      return await action(conn);
    } finally {
      try {
        await conn.close();
      } catch (_) {
        // swallow close errors
      }
    }
  }

  // Retry wrapper for transient socket/connection errors.
  Future<T> _withRetry<T>(Future<T> Function() action, {int retries = 1}) async {
    int attempt = 0;
    while (true) {
      try {
        return await action();
      } catch (e) {
        attempt++;
        final msg = e.toString().toLowerCase();
        final isTransient =
            msg.contains('socket') ||
            msg.contains('broken pipe') ||
            msg.contains('connection closed') ||
            msg.contains('reset by peer') ||
            msg.contains('timeout');
        if (!isTransient || attempt > retries) {
          // ignore: avoid_print
          print('Query/execute failed (attempt $attempt): $e');
          rethrow;
        }
        // ignore: avoid_print
        print('Transient DB error encountered, retrying... ($attempt/$retries)');
        await Future.delayed(const Duration(milliseconds: 150));
      }
    }
  }

  // Execute query and return results (read-only)
  Future<Results> query(String sql, [List? values]) async {
    return _withRetry(() => _withConnection((conn) => conn.query(sql, values)));
  }

  // Execute insert/update/delete query
  Future<Results> execute(String sql, [List? values]) async {
    return _withRetry(() => _withConnection((conn) => conn.query(sql, values)));
  }

  // Close database connection (no-op for per-call connections, but keep for compatibility)
  Future<void> close() async {
    try {
      await _connection?.close();
    } catch (_) {
      // swallow close errors
    } finally {
      _connection = null;
      // ignore: avoid_print
      print('Database connection closed');
    }
  }

  // Test database connection
  Future<bool> testConnection() async {
    try {
      await _withConnection((conn) async {
        await conn.query('SELECT 1');
      });
      return true;
    } catch (e) {
      // ignore: avoid_print
      print('Database connection test failed: $e');
      return false;
    }
  }
}
