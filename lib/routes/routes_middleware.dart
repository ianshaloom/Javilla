import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_service.dart';
import 'app_routes.dart';

class AuthRouteMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final isAuthenticated = Get.find<AuthService>().isAuthenticated;

    if (!isAuthenticated) {
      return const RouteSettings(name: AppRoutes.landing);
    }

    return null;
  }
}
