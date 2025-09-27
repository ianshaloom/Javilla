import 'package:get/get.dart';
import '../core/database/database_service.dart';
import '../models/api_response.dart';

class DatabaseController extends GetxController {
  final DatabaseService _databaseService = DatabaseService();

  // Observable variables
  final RxBool _isConnected = false.obs;
  final RxBool _isLoading = false.obs;
  final RxString _errorMessage = ''.obs;

  // Getters
  bool get isConnected => _isConnected.value;
  bool get isLoading => _isLoading.value;
  String get errorMessage => _errorMessage.value;

  @override
  void onInit() {
    super.onInit();
    _testConnection();
  }

  // Test database connection
  Future<void> _testConnection() async {
    try {
      _isLoading.value = true;
      _errorMessage.value = '';

      final isConnected = await _databaseService.testConnection();
      _isConnected.value = isConnected;

      if (!isConnected) {
        _errorMessage.value = 'Failed to connect to database';
      }
    } catch (e) {
      _isConnected.value = false;
      _errorMessage.value = e.toString();
    } finally {
      _isLoading.value = false;
    }
  }

  // Execute query
  Future<ApiResponse<dynamic>> executeQuery(String sql, [List? values]) async {
    try {
      _isLoading.value = true;
      _errorMessage.value = '';

      final results = await _databaseService.query(sql, values);
      return ApiResponse.success(results);
    } catch (e) {
      _errorMessage.value = e.toString();
      return ApiResponse.error(e.toString());
    } finally {
      _isLoading.value = false;
    }
  }

  // Execute insert/update/delete
  Future<ApiResponse<dynamic>> executeUpdate(String sql, [List? values]) async {
    try {
      _isLoading.value = true;
      _errorMessage.value = '';

      final results = await _databaseService.execute(sql, values);
      return ApiResponse.success(results);
    } catch (e) {
      _errorMessage.value = e.toString();
      return ApiResponse.error(e.toString());
    } finally {
      _isLoading.value = false;
    }
  }

  // Reconnect to database
  Future<void> reconnect() async {
    try {
      await _databaseService.close();
      await _testConnection();
    } catch (e) {
      _errorMessage.value = e.toString();
    }
  }

  // Clear error message
  void clearError() {
    _errorMessage.value = '';
  }

  @override
  void onClose() {
    _databaseService.close();
    super.onClose();
  }
}
