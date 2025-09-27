import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:javilla/controllers/filter_service.dart';
import 'firebase_options.dart';
import 'app/javilla.dart';
import 'controllers/auth_service.dart';
import 'controllers/database_controller.dart';
import 'controllers/sales_controller.dart';
import 'controllers/purchase_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize environment variables
  await dotenv.load(fileName: ".env");

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize GetX controllers
  AuthService.init();
  FilterService.init();
  Get.put(DatabaseController());
  Get.put(SalesController());
  Get.put(PurchaseController());

  runApp(const Javilla());
}
