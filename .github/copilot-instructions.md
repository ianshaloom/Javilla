# Javilla AI Coding Agent Instructions

## Architecture Overview

Javilla is a Flutter business management app using **GetX pattern with singleton services** and **direct MySQL connectivity**. The architecture follows a layered approach:

- **Controllers** (`lib/controllers/`): GetX services that manage UI state and coordinate between services
- **Services** (`lib/services/`): Business logic layer (Firebase auth, repositories)
- **Core** (`lib/core/`): Database connections, constants loaded from `.env`, themes
- **Models** (`lib/models/`): Data classes with helper methods for calculations and formatting
- **Widgets** (`lib/widgets/`): Organized by feature (home/, salesum/, stock/, common/)

## Critical Patterns

### GetX Service Initialization

Controllers use static factory pattern for singleton initialization:

```dart
// In controllers/auth_service.dart
static AuthService get to => Get.find();
static AuthService init() { return Get.put(AuthService()); }

// In main.dart - ALWAYS initialize in this order
AuthService.init();
FilterService.init();
Get.put(DatabaseController()); // Direct put for non-service controllers
```

### Database Architecture

Uses **short-lived connections** pattern (not connection pooling):

```dart
// DatabaseService creates/closes connections per operation
Future<T> _withConnection<T>(Future<T> Function(MySqlConnection conn) action) async {
  final conn = await MySqlConnection.connect(settings);
  try { return await action(conn); }
  finally { await conn.close(); }
}
```

### Environment Variables

Configuration loaded from `.env` file in main():

```dart
await dotenv.load(fileName: ".env");
// AppConstants.dart uses dotenv.env['KEY'] ?? 'fallback'
```

### API Response Pattern

All async operations return `ApiResponse<T>` wrapper:

```dart
return ApiResponse.success(data, message: 'Success');
return ApiResponse.error('Error message');
```

## Controller State Management

**Navigation Flow**: AuthService automatically redirects based on auth state using `ever()` listener:

```dart
// In AuthService
ever(_firebaseUser, _handleAuthStateChange);
// Uses AppNavigations.toLanding() / AppNavigations.toHome()
```

**UI Controllers**: Home screen initializes multiple controllers:

```dart
final SalesController _salesController = Get.put(SalesController());
final PurchaseController _purchaseController = Get.put(PurchaseController());
final StockController _stockController = Get.put(StockController());
```

## Development Workflows

### Environment Setup

1. Copy `.env.example` to `.env` with actual database credentials
2. Database schema is in `database/schema.sql` (currently placeholder)
3. `flutter pub get` installs dependencies including `flutter_dotenv`, `mysql1`, `firebase_auth`

### Testing Database Connection

DatabaseController auto-tests connection on init via `_testConnection()` - check this for connectivity issues.

### Firebase Configuration

Requires `google-services.json` in `android/app/` and Firebase initialization in main().

### Widget Organization

Widgets organized by feature, not type:

- `widgets/home/` - Home screen components (tabs, filters)
- `widgets/salesum/` - Sales summary widgets
- `widgets/stock/` - Stock management widgets
- `widgets/common/` - Reusable components

## Model Conventions

Models include computed properties and formatters:

```dart
// From salesum_model.dart
double get totalPaid => (paid ?? 0.0) + (examount ?? 0.0);
String get formattedPaid => paid?.toStringAsFixed(2) ?? '0.00';
String get formattedDate => sdate?.toString().split(' ')[0] ?? '';
```

## Route Protection

Uses GetX middleware for auth-protected routes:

```dart
GetPage(name: home, page: () => const HomeScreen(),
        middlewares: [AuthRouteMiddleware()]);
```

## Key Files for Reference

- `lib/main.dart` - Initialization sequence and dependency injection
- `lib/core/database/database_service.dart` - MySQL connection patterns
- `lib/controllers/auth_service.dart` - Authentication flow and auto-navigation
- `lib/models/api_response.dart` - Standard response wrapper
- `lib/routes/app_routes.dart` - Route definitions with middleware
- `.env.example` - Required environment variables template
