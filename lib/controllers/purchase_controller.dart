import 'package:get/get.dart';
import '../models/salesum_model.dart';
import '../repositories/purchase_repository.dart';
import 'filter_service.dart';

class PurchaseController extends GetxController {
  final PurchaseRepository _purchaseRepository = PurchaseRepository();

  // Observable variables
  final RxList<SalesumModel> _purchaseList = <SalesumModel>[].obs;
  final RxBool _isLoading = false.obs;
  final RxString _errorMessage = ''.obs;
  final RxMap<String, dynamic> _stats = <String, dynamic>{}.obs;

  // Getters
  List<SalesumModel> get purchaseList => _purchaseList;
  bool get isLoading => _isLoading.value;
  String get errorMessage => _errorMessage.value;
  Map<String, dynamic> get stats => _stats;

  @override
  void onInit() {
    super.onInit();
    loadPurchaseData();
  }

  // Load all purchase data
  Future<void> loadPurchaseData() async {
    try {
      _isLoading.value = true;
      _errorMessage.value = '';

      final response = await _purchaseRepository.getAllPurchases(FilterService.to.filterParams);

      if (response.success && response.data != null) {
        _purchaseList.value = response.data!;
        await generateStatsData();
      } else {
        _errorMessage.value = response.error ?? 'Failed to load purchase data';
      }
    } catch (e) {
      _errorMessage.value = 'Error loading purchase data: ${e.toString()}';
    } finally {
      _isLoading.value = false;
    }
  }

  // Generate stats data from sales data
  Future<void> generateStatsData() async {
    final stats = <String, double>{};

    stats['TOTAL'] = _purchaseList.fold(0, (sum, sales) => sum + (sales.extraAmount));

    _stats.value = stats;
  }

  // Refresh data
  Future<void> refreshData() async {
    await loadPurchaseData();
  }

  // Clear error message
  void clearError() {
    _errorMessage.value = '';
  }

  // Get total expenditure
  double get totalExpenditure {
    return _purchaseList.fold(0.0, (sum, purchase) => sum + (purchase.examount ?? 0.0));
  }

  // Get average purchase amount
  double get averagePurchaseAmount {
    if (_purchaseList.isEmpty) return 0.0;
    return totalExpenditure / _purchaseList.length;
  }

  // Get purchases count
  int get purchasesCount => _purchaseList.length;
}
