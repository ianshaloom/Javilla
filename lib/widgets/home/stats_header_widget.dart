import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../core/constants/images.dart';
import '../../core/helpers/helper_functions.dart';
import '../../models/salesum_type.dart';

class StatsHeaderWidget extends StatelessWidget {
  final dynamic controller;
  final SalesumType type;

  const StatsHeaderWidget({super.key, required this.controller, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: Obx(() {
        final stats = controller.stats;
        if (stats.isEmpty) {
          return const SizedBox.shrink();
        }

        if (type == SalesumType.purchase) {
          final value = (stats['TOTAL'] ?? 0.0) as num;

          return Container(
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'KES  ',
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.outline),
                      ),
                      TextSpan(
                        text: HelperFunctions.formatCurrencyEmp(value),
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1,
                          fontFamily: 'NotoSans',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }

        return Container(
          decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildIncomeTile(
                      context,
                      'Cash',
                      // const Color(0xFFffd9b3),
                      (stats['CASH'] ?? 0.0),
                      ImagesPaths.cash,
                    ),
                    const SizedBox(width: 5),

                    _buildIncomeTile(
                      context,
                      'Bank',
                      // const Color.fromARGB(255, 233, 206, 255),
                      (stats['BANK'] ?? 0.0),
                      ImagesPaths.bank,
                    ),
                    const SizedBox(width: 5),

                    _buildIncomeTile(
                      context,
                      'Card',
                      // const Color.fromARGB(255, 191, 233, 255),
                      (stats['CARD'] ?? 0.0),
                      ImagesPaths.card,
                    ),
                  ],
                ),
                const SizedBox(height: 5),

                Row(
                  children: [
                    _buildIncomeTile(
                      context,
                      'MPESA',
                      // const Color(0xFFe4ffb3),
                      (stats['MPESA'] ?? 0.0),
                      ImagesPaths.mpesa,
                    ),
                    _buildIncomeTile(context, 'Total', (stats['TOTAL'] ?? 0.0), null, 2),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  // -- Income Tile
  // colors - const Color(0xFFffd9b3), const Color(0xFFddb3ff),
  // const Color(0xFFb3e4ff),
  Widget _buildIncomeTile(BuildContext context, String title, num value, String? icon, [int flex = 1]) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: icon != null ? Theme.of(context).colorScheme.inversePrimary.withAlpha(150) : null,
        ),
        child: icon != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // icon & title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        icon,
                        width: 24,
                        height: 24,
                        colorFilter: title == 'MPESA'
                            ? null
                            : ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn),
                      ),
                      const SizedBox(width: 6),
                      if (title != 'MPESA')
                        Text(
                          title,
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w600),
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // value
                  Text(
                    HelperFunctions.formatCurrencyEmp(value),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.primary.withAlpha(220),
                      fontFamily: 'NotoSans',
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              )
            : Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'KES  ',
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.outline),
                      ),
                      TextSpan(
                        text: HelperFunctions.formatCurrencyEmp(value),
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1,
                          fontFamily: 'NotoSans',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
