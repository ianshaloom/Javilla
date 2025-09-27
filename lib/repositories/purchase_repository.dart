import '../core/database/database_service.dart';
import '../models/salesum_model.dart';
import '../models/api_response.dart';

class PurchaseRepository {
  final DatabaseService _databaseService = DatabaseService();

  // Get all purchase records (examount > 0 AND paid = 0)
  Future<ApiResponse<List<SalesumModel>>> getAllPurchases(Map<String, dynamic> filterParams) async {
    try {
      // chack if filterParams key filterType value is either 'this-date', 'today', 'yesterday'
      bool isSingleDateFilter = ['this-date', 'today', 'yesterday'].contains(filterParams['filterType']);

      if (isSingleDateFilter) {
        // Single date filter
        String date = filterParams['date'];
        final sql = '''
          SELECT * FROM salesum 
          WHERE DATE(sdate) = ? AND examount > 0 AND (paid = 0 OR paid IS NULL)
          ORDER BY sdate DESC, rno DESC
        ''';
        final results = await _databaseService.query(sql, [date]);

        final purchaseList = results.map((row) => SalesumModel.fromMap(row.fields)).toList();
        return ApiResponse.success(purchaseList);
      } else {
        // Date range filter
        String startDate = filterParams['startDate'];
        String endDate = filterParams['endDate'];
        final sql = '''
          SELECT * FROM salesum 
          WHERE DATE(sdate) >= ? AND DATE(sdate) <= ? 
          AND examount > 0 AND (paid = 0 OR paid IS NULL)
          ORDER BY sdate DESC, rno DESC
        ''';
        final results = await _databaseService.query(sql, [startDate, endDate]);

        final purchaseList = results.map((row) => SalesumModel.fromMap(row.fields)).toList();
        return ApiResponse.success(purchaseList);
      }
    } catch (e) {
      return ApiResponse.error('Failed to fetch purchase records: ${e.toString()}');
    }
  }
}
