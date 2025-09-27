import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:javilla/core/widgets/buttons/filled_btn.dart';

import '../../controllers/filter_service.dart';
import '../../controllers/purchase_controller.dart';
import '../../controllers/sales_controller.dart';
import '../../core/constants/images.dart';

class FilterBottomsheet extends StatelessWidget {
  const FilterBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Quick Filters'),
            const SizedBox(height: 10),
      
            // Quick filter buttons
            Obx(() {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      // Today button
                      ChoiceChip(
                        label: const Text('Today'),
                        selected:
                            FilterService.to.filterType.value == 'today',
                        onSelected: (selected) {
                          if (selected) {
                            FilterService.to.selectedDate.value =
                                DateTime.now();
                            FilterService.to.filterType.value = 'today';
                            FilterService.to.dateRange.value = null;
                          }
                        },
                      ),
      
                      // Yesterday button
                      ChoiceChip(
                        label: const Text('Yesterday'),
                        selected:
                            FilterService.to.filterType.value == 'yesterday',
                        onSelected: (selected) {
                          if (selected) {
                            FilterService.to.selectedDate.value =
                                DateTime.now().subtract(
                                  const Duration(days: 1),
                                );
                            FilterService.to.filterType.value = 'yesterday';
                            FilterService.to.dateRange.value = null;
                          }
                        },
                      ),
      
                      // Last Week button
                      ChoiceChip(
                        label: const Text('This Week'),
                        selected:
                            FilterService.to.filterType.value == 'this-week',
                        onSelected: (selected) {
                          if (selected) {
                            FilterService.to.setThisWeekFilter();
                          }
                        },
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      // Last 7 Days button
                      ChoiceChip(
                        label: const Text('Last Week'),
                        selected:
                            FilterService.to.filterType.value == 'last-week',
                        onSelected: (selected) {
                          if (selected) {
                            FilterService.to.setLastWeekFilter();
                          }
                        },
                      ),
      
                      // This Month button
                      ChoiceChip(
                        label: const Text('This Month'),
                        selected:
                            FilterService.to.filterType.value == 'this-month',
                        onSelected: (selected) {
                          if (selected) {
                            FilterService.to.setThisMonthFilter();
                          }
                        },
                      ),
      
                      // Last 30 Days button
                      ChoiceChip(
                        label: const Text('Last Month'),
                        selected:
                            FilterService.to.filterType.value == 'last-month',
                        onSelected: (selected) {
                          if (selected) {
                            FilterService.to.setLastMonthFilter();
                          }
                        },
                      ),
                    ],
                  ),
                ],
              );
            }),
            Divider(
              color: Colors.grey.withAlpha(20),
              height: 20,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
      
            Text('Custom Date Filters'),
            const SizedBox(height: 10),
            // Custom Date Filters
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CalendaTile(title: 'Date'),
                const SizedBox(height: 10),
                CalendaTile(title: 'Date Range'),
              ],
            ),
            const SizedBox(height: 20),
      
            // Close button
            CustomFilledBtn(
              onPressed: () {
                // close the bottom sheet
                Navigator.of(context).pop();
      
                // Call the API with the selected date
                Get.find<SalesController>().loadSalesData();
                Get.find<PurchaseController>().loadPurchaseData();
              },
              title: 'Apply Filter',
              pad: 10,
            ),
          ], // Column children
        ), // Column
      ), // Padding
    ); // SafeArea
  }
}

class CalendaTile extends StatelessWidget {
  final String title;

  const CalendaTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (title == 'Date') {
          FilterService.to.openDatePicker(context);
        } else {
          // Show date range picker
          FilterService.to.openDateRangePicker(context);
        }
      },
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        child: Row(
          children: [
            SvgPicture.asset(ImagesPaths.calendar, height: 40),
            const SizedBox(width: 7),
            Expanded(child: _buildDate(title, context)),
          ],
        ),
      ),
    );
  }

  Widget _buildDate(String title, BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme.onSurface;

    if (title == 'Date') {
      return Container(
        alignment: Alignment.centerLeft,
        height: 50,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: color.withAlpha(127)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Obx(
          () => FilterService.to.dateSelected
              ? Text(FilterService.to.currentFilterText)
              : Text(
                  "Choose a Date",
                  style: textTheme.bodyMedium?.copyWith(
                    color: color.withAlpha(127),
                  ),
                ),
        ),
      );
    } else {
      return Container(
        alignment: Alignment.centerLeft,
        height: 50,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: color.withAlpha(127)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Obx(
          () => FilterService.to.rangeSelected
              ? Text(FilterService.to.currentFilterText)
              : Text(
                  "Select Date Range",
                  style: textTheme.bodyMedium?.copyWith(
                    color: color.withAlpha(127),
                  ),
                ),
        ),
      );
    }
  }
}
