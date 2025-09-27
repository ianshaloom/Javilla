import 'package:get/get.dart';

import 'app_routes.dart';

/// This file contains the routes for the application
class AppNavigations {
  /// navigate to landing screen
  static void toLanding() => Get.offNamed(AppRoutes.landing);

  /// navigate to home screen
  static void toHome() => Get.offNamed(AppRoutes.home);
}
