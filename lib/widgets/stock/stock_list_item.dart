import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../models/stock_model.dart';

class StockListItem extends StatelessWidget {
  final StockModel stock;
  final VoidCallback? onTap;

  const StockListItem({super.key, required this.stock, this.onTap});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final Color qtyColor = stock.qty <= 0
        ? Colors.red
        : (stock.qty <= 5 ? Colors.orange : Colors.green);

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
                  // Name and Code
                  Text(
                    stock.displayName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  // Price and Qty summary
                  Text(
                    stock.formattedPrice,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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

              // Chips Row
              Row(
                children: [
                  ...[
                    CircleAvatar(
                      backgroundColor: qtyColor,
                      radius: 12,
                      child: Center(
                        child: Text(
                          stock.formattedQty,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: colorScheme.onSecondary,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                  _buildInfoChip(
                    context,
                    Iconsax.box5,
                    'Cost ${stock.formattedCost}',
                    colorScheme.surfaceContainer,
                    colorScheme.onSurfaceVariant,
                  ),
                  if (stock.hasCart) ...[
                    const SizedBox(width: 8),
                    _buildInfoChip(
                      context,
                      Iconsax.category5,
                      stock.cart!,
                      colorScheme.primaryContainer,
                      colorScheme.onPrimaryContainer,
                    ),
                  ],
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
    Color textColor,
  ) {
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
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
