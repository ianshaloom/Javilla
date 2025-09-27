import 'package:flutter/material.dart';
import '../../models/salesum_model.dart';
import '../../models/salesum_type.dart';

class SalesumDetailsDialog extends StatelessWidget {
  final SalesumModel salesum;
  final SalesumType type;

  const SalesumDetailsDialog({super.key, required this.salesum, required this.type});

  static void show(BuildContext context, SalesumModel salesum, SalesumType type) {
    showDialog(
      context: context,
      builder: (context) => SalesumDetailsDialog(salesum: salesum, type: type),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('${salesum.typeDisplayName} Record #${salesum.rno}'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailRow('Customer/Supplier', salesum.cname),
          _buildDetailRow('Receipt No', salesum.rcno ?? 'N/A'),
          if (type == SalesumType.sales) ...[
            _buildDetailRow('Amount Paid', salesum.formattedPaid),
            if (salesum.hasExtraAmount) _buildDetailRow('Extra Amount', salesum.formattedExtraAmount),
            _buildDetailRow('Total Revenue', salesum.formattedTotalPaid),
          ] else ...[
            _buildDetailRow('Purchase Amount', salesum.formattedExtraAmount),
          ],
          _buildDetailRow('Payment Method', salesum.paymentMethodDisplay),
          _buildDetailRow('Date', salesum.formattedDateTime),
          _buildDetailRow('User', salesum.user ?? 'N/A'),
        ],
      ),
      actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Close'))],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text('$label:', style: const TextStyle(fontWeight: FontWeight.w500)),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
