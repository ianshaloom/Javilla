import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../models/api_response.dart';
import '../services/auth_service.dart';
import '../routes/app_navigations.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  /// Initialize the service
  static AuthService init() {
    return Get.put(AuthService());
  }

  final AuthRepository _authRepo = AuthRepository();

  // Observable variables
  final Rx<User?> _firebaseUser = Rx<User?>(null);
  final RxBool _isLoading = false.obs;
  final RxString _errorMessage = ''.obs;

  // Getters
  User? get firebaseUser => _firebaseUser.value;
  bool get isLoading => _isLoading.value;
  String get errorMessage => _errorMessage.value;
  bool get isAuthenticated => _firebaseUser.value != null;

  @override
  void onInit() {
    super.onInit();
    _firebaseUser.bindStream(_authRepo.authStateChanges);

    // Listen to auth state changes and handle automatic redirection
    ever(_firebaseUser, _handleAuthStateChange);
  }

  @override
  void onReady() {
    super.onReady();
    // Check initial auth state and redirect accordingly after a delay
    Future.delayed(const Duration(milliseconds: 100), () {
      screenRedirect();
    });
  }

  // Handle authentication state changes
  void _handleAuthStateChange(User? user) {
    // Add a small delay to ensure GetMaterialApp is ready
    Future.delayed(const Duration(milliseconds: 50), () {
      if (user == null) {
        AppNavigations.toLanding();
      } else {
        AppNavigations.toHome();
      }
    });
  }

  // Sign in with Google
  Future<ApiResponse<User?>> signInWithGoogle() async {
    try {
      _isLoading.value = true;
      _errorMessage.value = '';

      final result = await _authRepo.signInWithGoogle();
      if (result == null) {
        return ApiResponse.error('Sign in cancelled');
      }

      return ApiResponse.success(result.user!, message: 'Sign in successful');
    } catch (e) {
      _errorMessage.value = e.toString();
      return ApiResponse.error(e.toString());
    } finally {
      _isLoading.value = false;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      _isLoading.value = true;
      await _authRepo.signOut();
      // No need to manually redirect here - _handleAuthStateChange will handle it
    } catch (e) {
      _errorMessage.value = e.toString();
    } finally {
      _isLoading.value = false;
    }
  }

  // Clear error message
  void clearError() {
    _errorMessage.value = '';
  }

  // Screen redirect based on authentication status
  void screenRedirect() {
    final user = _authRepo.currentUser;

    if (user != null) {
      AppNavigations.toHome();
    } else {
      AppNavigations.toLanding();
    }
  }
}
