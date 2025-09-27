import '../core/database/database_service.dart';
import '../models/salesum_model.dart';
import '../models/api_response.dart';

class SalesRepository {
  final DatabaseService _databaseService = DatabaseService();

  // Get all sales records (paid > 0 AND examount = 0)
  Future<ApiResponse<List<SalesumModel>>> getAllSales(Map<String, dynamic> filterParams) async {
    try {
      // chack if filterParams key filterType value is either 'this-date', 'today', 'yesterday'
      bool isSingleDateFilter = ['this-date', 'today', 'yesterday'].contains(filterParams['filterType']);

      if (isSingleDateFilter) {
        // Single date filter (use sargable range on sdate)
        String date = filterParams['date'];
        final sql = '''
          SELECT *
          FROM salesum
          WHERE sdate >= ? AND sdate < DATE_ADD(?, INTERVAL 1 DAY)
            AND paid > 0
            AND (examount = 0 OR examount IS NULL)
          ORDER BY sdate DESC, rno DESC
        ''';
        final results = await _databaseService.query(sql, [date, date]);

        final salesList = results.map((row) => SalesumModel.fromMap(row.fields)).toList();
        return ApiResponse.success(salesList);
      } else {
        // Date range filter (use half-open interval to include full end date)
        String startDate = filterParams['startDate'];
        String endDate = filterParams['endDate'];
        final sql = '''
          SELECT *
          FROM salesum
          WHERE sdate >= ? AND sdate < DATE_ADD(?, INTERVAL 1 DAY)
            AND paid > 0
            AND (examount = 0 OR examount IS NULL)
          ORDER BY sdate DESC, rno DESC
        ''';
        final results = await _databaseService.query(sql, [startDate, endDate]);

        final salesList = results.map((row) => SalesumModel.fromMap(row.fields)).toList();
        return ApiResponse.success(salesList);
      }
    } catch (e) {
      return ApiResponse.error('Failed to fetch sales records: ${e.toString()}');
    }
  }
}
