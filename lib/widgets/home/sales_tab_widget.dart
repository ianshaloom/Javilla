import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/sales_controller.dart';
import '../../models/salesum_type.dart';
import '../../widgets/common/loading_widget.dart';
import '../../widgets/common/error_widget.dart';
import 'stats_header_widget.dart';
import 'empty_state_widget.dart';
import 'transaction_tile.dart';

class SalesTabWidget extends StatelessWidget {
  const SalesTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final SalesController salesController = Get.find<SalesController>();

    return Obx(() {
      if (salesController.isLoading && salesController.salesList.isEmpty) {
        return const LoadingWidget(message: 'Loading sales data...');
      }

      if (salesController.errorMessage.isNotEmpty) {
        return CustomErrorWidget(message: salesController.errorMessage, onRetry: () => salesController.refreshData());
      }

      if (salesController.salesList.isEmpty) {
        return const EmptyStateWidget(type: SalesumType.sales);
      }

      return RefreshIndicator(
        onRefresh: () => salesController.refreshData(),
        child: CustomScrollView(
          slivers: [
            // Sliver App Bar with Stats Header
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 150,
              collapsedHeight: 0,
              toolbarHeight: 0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: StatsHeaderWidget(controller: salesController, type: SalesumType.sales),
                titlePadding: const EdgeInsets.all(0),
              ),
            ),

            // Sales List
            SliverPadding(
              padding: const EdgeInsets.only(top: 8, right: 5, left: 5),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final salesum = salesController.salesList[index];
                  return TransactionTile(transaction: salesum);
                }, childCount: salesController.salesList.length),
              ),
            ),
          ],
        ),
      );
    });
  }
}
