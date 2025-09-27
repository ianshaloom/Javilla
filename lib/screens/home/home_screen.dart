import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../controllers/auth_service.dart';
import '../../controllers/sales_controller.dart';
import '../../controllers/purchase_controller.dart';
import '../../controllers/stock_controller.dart';
import '../../core/constants/images.dart';
import '../../widgets/home/filter_bottomsheet.dart';
import '../../widgets/home/sales_tab_widget.dart';
import '../../widgets/home/purchases_tab_widget.dart';
import '../../widgets/home/stock_tab_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final AuthService _authController = Get.find<AuthService>();
  final SalesController _salesController = Get.put(SalesController());
  final PurchaseController _purchaseController = Get.put(PurchaseController());
  final StockController _stockController = Get.put(StockController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Business Summary'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            _buildTabIcon(ImagesPaths.sale),
            _buildTabIcon(ImagesPaths.consumables),
            _buildTabIcon(ImagesPaths.stock),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => _refreshCurrentTab(),
            icon: const Icon(Iconsax.refresh, size: 20),
            tooltip: 'Refresh',
          ),
          IconButton(onPressed: () => _authController.signOut(), icon: const Icon(Iconsax.logout), tooltip: 'Sign Out'),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [SalesTabWidget(), PurchasesTabWidget(), StockTabWidget()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => openFiltersModalSheet(context),
        child: SvgPicture.asset(
          ImagesPaths.calendar,
          height: 35,
          colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn),
        ),
      ),
    );
  }

  /// Tab Icon
  Widget _buildTabIcon(String assetPath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SvgPicture.asset(
        assetPath,
        colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn),
        height: 30,
      ),
    );
  }

  /// Refresh data in the current tab
  void _refreshCurrentTab() {
    if (_tabController.index == 0) {
      _salesController.refreshData();
    } else if (_tabController.index == 1) {
      _purchaseController.refreshData();
    } else {
      _stockController.refreshData();
    }
  }

  /// open modal bottomsheet
  openFiltersModalSheet(BuildContext context) {
    showModalBottomSheet(context: context, builder: (_) => const FilterBottomsheet());
  }
}
