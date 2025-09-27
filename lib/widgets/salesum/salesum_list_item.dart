import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../models/salesum_model.dart';

class SalesumListItem extends StatelessWidget {
  final SalesumModel salesum;
  final VoidCallback? onTap;

  const SalesumListItem({super.key, required this.salesum, this.onTap});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Record Number and Customer
                  Text(
                    salesum.cname,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  // Amount Info
                  Text(
                    salesum.formattedExtraAmount,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontFamily: 'NotoSans',
                      letterSpacing: 0.3,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: colorScheme.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Details Row
              Row(
                children: [
                  // qty
                  if (salesum.exqty != null && salesum.exqty! > 0) ...[
                    _buildInfoChip(
                      context,
                      Iconsax.box_tick5,
                      salesum.exqty!.toStringAsFixed(0),
                      colorScheme.surfaceContainer,
                      colorScheme.onSurfaceVariant,
                      qty: true,
                    ),
                    const SizedBox(width: 8),
                  ],

                  // Receipt Number
                  if (salesum.hasReceiptNumber) ...[
                    _buildInfoChip(
                      context,
                      Icons.receipt,
                      salesum.rcno!,
                      colorScheme.surfaceContainerHighest,
                      colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 8),
                  ],

                  // Payment Method
                  /*if (salesum.payvia != null && salesum.payvia!.isNotEmpty)
                    _buildInfoChip(
                      context,
                      salesum.isCashPayment ? Icons.payments : Icons.credit_card,
                      salesum.paymentMethodDisplay,
                      colorScheme.primaryContainer,
                      colorScheme.onPrimaryContainer,
                    ),*/
                ],
              ),
              const SizedBox(height: 8),

              // Date and User
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    salesum.formattedDate,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontFamily: 'NotoSans',
                    ),
                  ),
                  if (salesum.user != null && salesum.user!.isNotEmpty)
                    Row(
                      children: [
                        Icon(Iconsax.user, size: 15),
                        const SizedBox(width: 4),
                        Text(
                          '${salesum.user}',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: colorScheme.onSurfaceVariant),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoChip(
    BuildContext context,
    IconData icon,
    String text,
    Color backgroundColor,
    Color textColor, {
    bool qty = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: textColor),
          const SizedBox(width: 4),
          Text(
            text,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: textColor,
              fontWeight: FontWeight.w500,
              fontSize: qty ? 14 : null,
            ),
          ),
        ],
      ),
    );
  }
}
