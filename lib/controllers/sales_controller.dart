import 'package:get/get.dart';
import '../models/salesum_model.dart';
import '../repositories/sales_repository.dart';
import 'filter_service.dart';

class SalesController extends GetxController {
  final SalesRepository _salesRepository = SalesRepository();

  // Observable variables
  final RxList<SalesumModel> _salesList = <SalesumModel>[].obs;
  final RxBool _isLoading = false.obs;
  final RxString _errorMessage = ''.obs;
  final RxMap<String, dynamic> _stats = <String, dynamic>{}.obs;

  // Getters
  List<SalesumModel> get salesList => _salesList;
  bool get isLoading => _isLoading.value;
  String get errorMessage => _errorMessage.value;
  Map<String, dynamic> get stats => _stats;

  @override
  void onInit() {
    super.onInit();
    loadSalesData();
  }

  // Load all sales data
  Future<void> loadSalesData() async {
    try {
      _isLoading.value = true;
      _errorMessage.value = '';

      final response = await _salesRepository.getAllSales(FilterService.to.filterParams);

      if (response.success && response.data != null) {
        _salesList.value = response.data!;
        await generateStatsData();
      } else {
        _errorMessage.value = response.error ?? 'Failed to load sales data';
      }
    } catch (e) {
      _errorMessage.value = 'Error loading sales data: ${e.toString()}';
    } finally {
      _isLoading.value = false;
    }
  }

  // Generate stats data from sales data
  Future<void> generateStatsData() async {
    final stats = <String, double>{};

    // get a set of payvias using set
    final payvias = _salesList.map((sales) => sales.payvia ?? '').toSet();

    for (var payvia in payvias) {
      stats[payvia] = _salesList
          .where((sales) => sales.payvia == payvia)
          .fold(0, (sum, sales) => sum + (sales.paid ?? 0));
    }

    stats['TOTAL'] = stats.values.fold(0, (sum, value) => sum + value);

    _stats.value = stats;
  }

  // Refresh data
  Future<void> refreshData() async {
    await loadSalesData();
  }

  // Clear error message
  void clearError() {
    _errorMessage.value = '';
  }

  // Get total revenue
  double get totalRevenue {
    return _salesList.fold(0.0, (sum, sales) => sum + (sales.paid ?? 0.0));
  }

  // Get average sale amount
  double get averageSaleAmount {
    if (_salesList.isEmpty) return 0.0;
    return totalRevenue / _salesList.length;
  }

  // Get sales count
  int get salesCount => _salesList.length;
}
