import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:javilla/models/salesum_model.dart';

import '../../core/constants/images.dart';
import '../../core/helpers/helper_functions.dart';

class TransactionTile extends StatelessWidget {
  final SalesumModel transaction;
  final VoidCallback? onTap;

  const TransactionTile({super.key, required this.transaction, this.onTap});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final font = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 17),
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 0,
              child: Text(
                HelperFunctions.elapsedTime(transaction.sdate ?? DateTime.now()),
                style: font.bodyMedium!.copyWith(color: color.onSurface.withAlpha(77), fontSize: 11),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 10,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(3),
                child: Row(
                  children: [
                    Icon(Icons.person_2_rounded, size: 15, color: color.primary),
                    const SizedBox(width: 5),
                    if (transaction.user != null && transaction.user!.isNotEmpty)
                      Text(
                        transaction.user!,
                        style: font.bodyMedium!.copyWith(color: color.onSurface.withAlpha(77), fontSize: 11),
                      ),
                  ],
                ),
              ),
            ),
            Container(
              height: 70,
              // color: Colors.black26,
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: color.onSurface.withAlpha(18), width: 0.5)),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: SvgPicture.asset(
                  ImagesPaths.receipt,
                  height: 50,
                  colorFilter: transaction.payViaEmpty
                      ? ColorFilter.mode(color.secondary, BlendMode.srcIn)
                      : ColorFilter.mode(color.primary, BlendMode.srcIn),
                ),
                title: Row(
                  children: [
                    Text(
                      '# ${transaction.rcno} ~ ${transaction.cname.toUpperCase()}',
                      style: font.bodyMedium!.copyWith(fontWeight: FontWeight.w600, color: color.onSurface),
                    ),
                  ],
                ),
                subtitle: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('KES ', style: font.bodyMedium!.copyWith(fontSize: 10)),
                    Text(
                      '${transaction.paid}',
                      style: font.bodyMedium!.copyWith(color: color.onSurface.withAlpha(178), fontFamily: 'NotoSans'),
                    ),
                    const SizedBox(width: 2),

                    // payment chip
                    if (transaction.payvia != null && transaction.payvia!.isNotEmpty)
                      Container(
                        margin: const EdgeInsets.only(left: 6, bottom: 3),
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: color.primary.withAlpha(20),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              transaction.isCashPayment
                                  ? Icons.money
                                  : transaction.isCardPayment
                                  ? Icons.credit_card
                                  : transaction.isBankPayment
                                  ? Icons.account_balance
                                  : Icons.payments,
                              size: 12,
                              color: color.primary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              transaction.paymentMethodDisplay,
                              style: font.bodySmall!.copyWith(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: color.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
