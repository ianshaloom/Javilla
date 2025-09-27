import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/purchase_controller.dart';
import '../../models/salesum_type.dart';
import '../../models/salesum_model.dart';
import '../../widgets/common/loading_widget.dart';
import '../../widgets/common/error_widget.dart';
import '../../widgets/salesum/salesum_list_item.dart';
import 'stats_header_widget.dart';
import 'empty_state_widget.dart';
import 'salesum_details_dialog.dart';

class PurchasesTabWidget extends StatelessWidget {
  const PurchasesTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final PurchaseController purchaseController =
        Get.find<PurchaseController>();

    return Obx(() {
      if (purchaseController.isLoading) {
        return const LoadingWidget(message: 'Loading purchase data...');
      }

      if (purchaseController.errorMessage.isNotEmpty) {
        return CustomErrorWidget(
          message: purchaseController.errorMessage,
          onRetry: () => purchaseController.refreshData(),
        );
      }

      if (purchaseController.purchaseList.isEmpty) {
        return const EmptyStateWidget(type: SalesumType.purchase);
      }

      return RefreshIndicator(
        onRefresh: () => purchaseController.refreshData(),
        child: CustomScrollView(
          slivers: [
            // Sliver App Bar with Stats Header
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 60,
              collapsedHeight: 0,
              toolbarHeight: 0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: StatsHeaderWidget(
                  controller: purchaseController,
                  type: SalesumType.purchase,
                ),
              ),
            ),

            // Purchase List
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final salesum = purchaseController.purchaseList[index];
                return SalesumListItem(
                  salesum: salesum,
                  onTap: () => _showSalesumDetails(context, salesum),
                );
              }, childCount: purchaseController.purchaseList.length),
            ),
          ],
        ),
      );
    });
  }

  void _showSalesumDetails(BuildContext context, SalesumModel salesum) {
    SalesumDetailsDialog.show(context, salesum, SalesumType.purchase);
  }
}
