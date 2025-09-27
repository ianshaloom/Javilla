import 'package:get/get.dart';
import 'package:javilla/core/theme/app_theme.dart';
import 'package:javilla/core/constants/app_constants.dart';
import 'package:javilla/routes/app_routes.dart';
import 'package:flutter/material.dart';

class Javilla extends StatelessWidget {
  const Javilla({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstants.appName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.home,
      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
