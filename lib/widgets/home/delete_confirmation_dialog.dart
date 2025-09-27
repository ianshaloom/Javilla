import 'package:flutter/material.dart';
import '../../models/salesum_model.dart';
import '../../models/salesum_type.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  final dynamic controller;
  final SalesumModel salesum;
  final SalesumType type;

  const DeleteConfirmationDialog({
    super.key,
    required this.controller,
    required this.salesum,
    required this.type,
  });

  static void show(
    BuildContext context,
    dynamic controller,
    SalesumModel salesum,
    SalesumType type,
  ) {
    showDialog(
      context: context,
      builder: (context) => DeleteConfirmationDialog(
        controller: controller,
        salesum: salesum,
        type: type,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Delete ${salesum.typeDisplayName} Record'),
      content: Text(
        'Are you sure you want to delete ${salesum.typeDisplayName.toLowerCase()} record #${salesum.rno} for ${salesum.cname}?',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            Navigator.of(context).pop();
            if (type == SalesumType.sales) {
              await controller.deleteSales(salesum.rno);
            } else {
              await controller.deletePurchase(salesum.rno);
            }
          },
          child: const Text('Delete'),
        ),
      ],
    );
  }
}
