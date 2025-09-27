import 'package:flutter/material.dart';
import '../../models/salesum_model.dart';
import '../../models/salesum_type.dart';
import '../../widgets/salesum/salesum_list_item.dart';
import 'salesum_details_dialog.dart';

class SalesumListWidget extends StatelessWidget {
  final dynamic controller;
  final SalesumType type;

  const SalesumListWidget({super.key, required this.controller, required this.type});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => controller.refreshData(),
      child: ListView.builder(
        itemCount: type == SalesumType.sales ? controller.salesList.length : controller.purchaseList.length,
        itemBuilder: (context, index) {
          final salesum = type == SalesumType.sales ? controller.salesList[index] : controller.purchaseList[index];
          return SalesumListItem(salesum: salesum, onTap: () => _showSalesumDetails(context, salesum, type));
        },
      ),
    );
  }

  void _showSalesumDetails(BuildContext context, SalesumModel salesum, SalesumType type) {
    SalesumDetailsDialog.show(context, salesum, type);
  }
}
