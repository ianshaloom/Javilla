import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HelperFunctions {
  static DateTime getStartOfWeek(DateTime date) {
    final int daysUntilMonday = date.weekday - 1;
    final DateTime startOfWeek = date.subtract(Duration(days: daysUntilMonday));
    return DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day, 0, 0, 0, 0, 0);
  }

  static String elapsedTime(DateTime pdate) {
    // Calculate elapsed time from the given DateTime
    final now = DateTime.now();
    final difference = now.difference(pdate);

    if (difference.inDays > 0) {
      return customDate(pdate);
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }

  static String customDate(DateTime date) {
    String day = DateFormat.d().format(date);
    String month = DateFormat.MMM().format(date);
    return '$day $month';
  }

  /// Get greeting message based on the current time
  static String getGreetingMessage() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(content: Text(message)));
  }

  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('OK'))],
        );
      },
    );
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static String getFormattedDate(DateTime date, {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }

  static String fileFullPath(String url) {
    final uri = Uri.parse(url);
    final pathSegments = uri.pathSegments;

    // We expect at least 5 segments for a valid Firebase Storage object path:
    // v0, b, <bucket_name>, o, <encoded_object_path>
    if (pathSegments.length < 5) {
      throw ArgumentError('Invalid Firebase Storage URL format. Expected at least 5 path segments.');
    }

    // The full Firebase Storage path is the segment at index 4,
    // which is URL-encoded.
    final encodedPath = pathSegments[4];

    // Decode the URL-encoded path to get the original file path
    // with correct slashes and other characters.
    return Uri.decodeComponent(encodedPath);
  }

  // -- Currency Formatting - KE
  static String formatCurrency(num amount) {
    return NumberFormat.currency(locale: 'en_KE', symbol: 'KES ').format(amount);
  }

  // -- without locale and symbol
  static String formatCurrencyEmp(num amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '').format(amount);
  }
}
