import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../helpers/helper_functions.dart';
import '../theme/theme.dart';

class SnackToasts {
  static hideSnackBar() =>
      ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  static customToast({required message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        width: 500,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: HelperFunctions.isDarkMode(Get.context!)
                ? MaterialTheme.darkScheme().onSurface.withAlpha(230)
                : MaterialTheme.lightScheme().onSurface.withAlpha(230),
          ),
          child: Center(
            child: Text(
              message,
              style: Theme.of(Get.context!).textTheme.labelLarge,
            ),
          ),
        ),
      ),
    );
  }

  // toast with button
  static customToastWithButton({
    required message,
    required String buttonText,
    required VoidCallback onPressed,
  }) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        width: double.infinity,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: HelperFunctions.isDarkMode(Get.context!)
                ? MaterialTheme.darkScheme().onSurface.withAlpha(90)
                : MaterialTheme.lightScheme().onSurface.withAlpha(90),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  message,
                  style: Theme.of(Get.context!).textTheme.labelLarge,
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: MaterialTheme.lightScheme().primary,
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: onPressed,
                child: Text(
                  buttonText,
                  style: Theme.of(Get.context!).textTheme.labelLarge!.copyWith(
                    color: MaterialTheme.lightScheme().onPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static successSnackBar({required title, message = '', duration = 3}) {
    Get.snackbar(
      title,
      message,
      maxWidth: 600,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: Icon(Iconsax.check, color: MaterialTheme.lightScheme().onPrimary),
    );
  }

  static infoSnackBar({
    required title,
    message = '',
    snackPosition = SnackPosition.BOTTOM,
    duration = 3,
  }) {
    Get.snackbar(
      title,
      message,
      maxWidth: 600,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: MaterialTheme.lightScheme().onPrimary,
      backgroundColor: Colors.blue,
      snackPosition: snackPosition,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: Icon(
        Iconsax.info_circle,
        color: MaterialTheme.lightScheme().onPrimary,
      ),
    );
  }

  static warningSnackBar({
    required title,
    message = '',
    snackPosition = SnackPosition.BOTTOM,
  }) {
    Get.snackbar(
      title,
      message,
      maxWidth: 600,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: MaterialTheme.lightScheme().onPrimary,
      backgroundColor: Colors.orange,
      snackPosition: snackPosition,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: Icon(
        Iconsax.warning_2,
        color: MaterialTheme.lightScheme().onPrimary,
      ),
    );
  }

  static errorSnackBar({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      maxWidth: 600,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: MaterialTheme.lightScheme().onPrimary,
      backgroundColor: Colors.red.shade600,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: Icon(
        Iconsax.warning_2,
        color: MaterialTheme.lightScheme().onPrimary,
      ),
    );
  }
}
