import 'package:get/get.dart';
import '../screens/landing/landing_screen.dart';
import '../screens/home/home_screen.dart';
import 'routes_middleware.dart';

class AppRoutes {
  static const String landing = '/landing';
  static const String home = '/home';

  static List<GetPage> routes = [
    GetPage(name: landing, page: () => const LandingScreen()),
    GetPage(
      name: home,
      page: () => const HomeScreen(),
      middlewares: [AuthRouteMiddleware()],
    ),
  ];
}
