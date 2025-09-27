import '../core/database/database_service.dart';
import '../models/stock_model.dart';
import '../models/api_response.dart';

class StockRepository {
  final DatabaseService _databaseService = DatabaseService();

  // Fetch stock items where qty > 0
  Future<ApiResponse<List<StockModel>>> getAvailableStock() async {
    try {
      // Assumes table name is `stock` with columns: rno, pno, pname, cost, price, qty, cart
      const sql = '''
        SELECT rno, pno, pname, cost, price, qty, cart
        FROM stock
        WHERE qty > 0
        ORDER BY pname ASC, rno DESC
      ''';
      final results = await _databaseService.query(sql);

      final stockList = results.map((row) => StockModel.fromMap(row.fields)).toList();
      return ApiResponse.success(stockList);
    } catch (e) {
      return ApiResponse.error('Failed to fetch available stock: ${e.toString()}');
    }
  }
}
