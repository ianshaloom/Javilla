import 'package:get/get.dart';
import '../models/stock_model.dart';
import '../repositories/stock_repository.dart';

class StockController extends GetxController {
  final StockRepository _stockRepository = StockRepository();

  // Observable state
  final RxList<StockModel> _stockList = <StockModel>[].obs;
  final RxList<StockModel> _filteredStockList = <StockModel>[].obs;

  final RxString _searchQuery = ''.obs;
  final RxBool _isLoading = false.obs;
  final RxString _errorMessage = ''.obs;

  // Getters for UI
  List<StockModel> get stockList => _stockList;
  List<StockModel> get filteredStockList => _filteredStockList;
  bool get isLoading => _isLoading.value;
  String get errorMessage => _errorMessage.value;

  @override
  void onInit() {
    super.onInit();
    loadAvailableStock();
  }

  // Load in-stock items (qty > 0)
  Future<void> loadAvailableStock() async {
    try {
      _isLoading.value = true;
      _errorMessage.value = '';

      final response = await _stockRepository.getAvailableStock();
      if (response.success && response.data != null) {
        _stockList.value = response.data!;
        updateSearchQuery(_searchQuery.value); // Apply current search filter
      } else {
        _errorMessage.value = response.error ?? 'Failed to load stock';
      }
    } catch (e) {
      _errorMessage.value = 'Error loading stock: ${e.toString()}';
    } finally {
      _isLoading.value = false;
    }
  }

  // Update search query and filter stock list
  void updateSearchQuery(String query) {
    _searchQuery.value = query.toLowerCase();
    if (_searchQuery.value.isEmpty) {
      _filteredStockList.value = List<StockModel>.from(_stockList);
    } else {
      _filteredStockList.value = _stockList.where((stock) {
        return stock.displayName.toLowerCase().contains(_searchQuery.value);
      }).toList();
    }
  }

  // Refresh data
  Future<void> refreshData() async {
    await loadAvailableStock();
  }

  // Clear error message
  void clearError() {
    _errorMessage.value = '';
  }

  // Aggregates for UI summaries
  double get totalQty => _stockList.fold(0.0, (sum, s) => sum + s.qty);
  double get totalCostValue =>
      _stockList.fold(0.0, (sum, s) => sum + s.totalCost);
  double get totalPriceValue =>
      _stockList.fold(0.0, (sum, s) => sum + s.totalRevenue);
  double get totalMarginValue =>
      _stockList.fold(0.0, (sum, s) => sum + s.totalMargin);
}
