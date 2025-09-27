import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/stock_controller.dart';
import '../../widgets/common/loading_widget.dart';
import '../../widgets/common/error_widget.dart';
import '../stock/stock_list_item.dart';

class StockTabWidget extends StatelessWidget {
  const StockTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final StockController stockController = Get.find<StockController>();

    return Obx(() {
      if (stockController.isLoading && stockController.stockList.isEmpty) {
        return const LoadingWidget(message: 'Loading stock...');
      }

      if (stockController.errorMessage.isNotEmpty) {
        return CustomErrorWidget(
          message: stockController.errorMessage,
          onRetry: () => stockController.refreshData(),
        );
      }

      if (stockController.stockList.isEmpty) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              'No in-stock items found',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
        );
      }

      return RefreshIndicator(
        onRefresh: () => stockController.refreshData(),
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            // sliver app bar with search bar
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 60,
              collapsedHeight: 0,
              toolbarHeight: 0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: TextField(
                    onChanged: (value) =>
                        stockController.updateSearchQuery(value),
                    style: Theme.of(context).textTheme.bodyMedium,
                    decoration: InputDecoration(
                      hintText: 'Search stock...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Theme.of(
                        context,
                      ).colorScheme.surfaceContainerHighest.withAlpha(20),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Stock List
            SliverList.builder(
              itemCount: stockController.filteredStockList.length,
              itemBuilder: (context, index) {
                final stock = stockController.filteredStockList[index];
                return StockListItem(stock: stock);
              },
            ),
          ],
        ),
      );
    });
  }
}
