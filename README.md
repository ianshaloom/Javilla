# Javilla - Flutter App Structure

This document outlines the organized codebase structure for the Javilla Flutter application.

## 📁 Directory Structure

```
lib/
├── core/                           # Core functionality
│   ├── constants/
│   │   └── app_constants.dart     # App-wide constants and configuration
│   ├── database/
│   │   └── database_service.dart  # MySQL database connection service
│   └── theme/
│       └── app_theme.dart         # App theme configuration
├── models/                         # Data models
│   └── api_response.dart          # API response wrapper
├── controllers/                    # GetX controllers
│   ├── auth_controller.dart       # Authentication state management
│   └── database_controller.dart   # Database operations management
├── services/                       # Business logic services
│   └── auth_service.dart          # Firebase authentication service
├── screens/                        # UI screens
│   ├── landing/
│   │   └── landing_screen.dart    # Landing screen with sign-in
│   └── home/
│       └── home_screen.dart       # Home screen
├── widgets/                        # Reusable UI components
│   └── common/
│       ├── loading_widget.dart    # Loading indicator widget
│       └── error_widget.dart      # Error display widget
├── routes/
│   └── app_routes.dart            # App routing configuration
└── main.dart                      # App entry point
```

## 🏗️ Architecture Overview

### **Core Layer**
- **Constants**: App-wide configuration and constants
- **Database**: MySQL connection and query management
- **Theme**: Consistent UI theming

### **Data Layer**
- **Models**: API response wrapper for consistent data handling
- **Services**: Business logic and Firebase authentication

### **Presentation Layer**
- **Controllers**: GetX state management
- **Screens**: Full-screen UI components
- **Widgets**: Reusable UI components

### **Navigation Layer**
- **Routes**: App navigation configuration with middleware protection

## 🔧 Key Features

- **GetX State Management**: Reactive state management with minimal boilerplate
- **MySQL Integration**: Direct database connectivity with connection pooling
- **Firebase Authentication**: Google Sign-In integration
- **Clean Architecture**: Separation of concerns with organized layers
- **Error Handling**: Comprehensive error handling and user feedback
- **Responsive UI**: Material Design with custom theming

## 📋 Setup Instructions

1. **Database Configuration**: Update `app_constants.dart` with your MySQL credentials
2. **Database Schema**: Run the SQL script in `database/schema.sql`
3. **Firebase Setup**: Ensure `google-services.json` is properly configured
4. **Dependencies**: Run `flutter pub get` to install packages

## 🚀 Usage Examples

### Database Operations
```dart
final dbController = Get.find<DatabaseController>();
final result = await dbController.executeQuery('SELECT * FROM users');
```

### Authentication
```dart
final authController = Get.find<AuthController>();
await authController.signInWithGoogle();
```

### Navigation
```dart
Get.toNamed(AppRoutes.home);
Get.offAllNamed(AppRoutes.auth);
```

## 🔄 State Management Flow

1. **User Action** → Controller
2. **Controller** → Service (business logic)
3. **Service** → Database/API
4. **Response** → Model
5. **Model** → Controller (state update)
6. **Controller** → UI (reactive update)

This structure provides a scalable foundation for your Flutter app with clear separation of concerns and easy maintenance.
