import 'salesum_model.dart';

enum SalesumType { sales, purchase }

extension SalesumTypeExtension on SalesumModel {
  SalesumType get type {
    if ((paid ?? 0) > 0 && (examount ?? 0) == 0) return SalesumType.sales;
    if ((examount ?? 0) > 0 && (paid ?? 0) == 0) return SalesumType.purchase;
    return SalesumType.sales; // default fallback
  }

  bool get isSales => type == SalesumType.sales;
  bool get isPurchase => type == SalesumType.purchase;

  String get typeDisplayName {
    switch (type) {
      case SalesumType.sales:
        return 'Sales';
      case SalesumType.purchase:
        return 'Purchase';
    }
  }

  String get typeIcon {
    switch (type) {
      case SalesumType.sales:
        return '💰';
      case SalesumType.purchase:
        return '🛒';
    }
  }
}
