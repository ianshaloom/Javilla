import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  // Database Configuration
  static String get dbHost => dotenv.env['DB_HOST'] ?? 'localhost';
  static int get dbPort =>
      int.tryParse(dotenv.env['DB_PORT'] ?? '3306') ?? 3306;
  static String get dbName => dotenv.env['DB_NAME'] ?? '';
  static String get dbUsername => dotenv.env['DB_USERNAME'] ?? '';
  static String get dbPassword => dotenv.env['DB_PASSWORD'] ?? '';

  // App Configuration
  static String get appName => dotenv.env['APP_NAME'] ?? 'Javilla';
  static String get appVersion => dotenv.env['APP_VERSION'] ?? '1.0.0';

  // API Endpoints (if needed later)
  static String get baseUrl =>
      dotenv.env['BASE_URL'] ?? 'https://api.javilla.com';

  // Firebase Configuration
  static String get firebaseApiKey => dotenv.env['FIREBASE_API_KEY'] ?? '';
  static String get firebaseAppId => dotenv.env['FIREBASE_APP_ID'] ?? '';
  static String get firebaseMessagingSenderId =>
      dotenv.env['FIREBASE_MESSAGING_SENDER_ID'] ?? '';
  static String get firebaseProjectId =>
      dotenv.env['FIREBASE_PROJECT_ID'] ?? '';
  static String get firebaseStorageBucket =>
      dotenv.env['FIREBASE_STORAGE_BUCKET'] ?? '';

  // App Routes
  static const String splashRoute = '/';
  static const String authRoute = '/auth';
  static const String homeRoute = '/home';
  static const String profileRoute = '/profile';
}
