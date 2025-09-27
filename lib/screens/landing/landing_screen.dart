import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import '../../core/constants/images.dart';
import '../../controllers/auth_service.dart';
import '../../core/widgets/containers/circular_container.dart';
import '../../core/widgets/snacks.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService authController = Get.find<AuthService>();
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              colorScheme.primary.withValues(alpha: 0.1),
              colorScheme.surface,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App Logo/Icon
                CircularContainer(
                  width: 150,
                  height: 150,
                  padding: const EdgeInsets.all(5),
                  backgroundColor: colorScheme.primary,
                  child: SvgPicture.asset(ImagesPaths.logo),
                ),
                const SizedBox(height: 32),

                // App Name
                Text(
                  'Javilla',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 16),

                // Welcome Message
                Text(
                  'Welcome to Javilla',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),

                // Description
                Text(
                  'Sign in with your Google account to get started',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),

                Obx(() {
                  if (authController.isLoading) {
                    return loadingAnimationWidget();
                  }
                  return signInWidget(authController, colorScheme, context);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Sign in with Google widget
  Column signInWidget(
    AuthService authController,
    ColorScheme colorScheme,
    BuildContext context,
  ) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton.icon(
            onPressed: () => _signInWithGoogle(authController),
            icon: SvgPicture.asset(ImagesPaths.google, width: 24, height: 24),
            label: const Text('Sign in with Google'),
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Additional Info
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: 'By signing in,  you agree to our ',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              TextSpan(
                text: ' Terms & Condition',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colorScheme.primary,
                ),
              ),
              TextSpan(
                text: ' and ',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              TextSpan(
                text: 'Privacy Policy.*',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Loading animation widget
  Widget loadingAnimationWidget() {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Lottie.asset(
        ImagesPaths.googleSignIn,
        fit: BoxFit.contain,
        width: double.infinity,
      ),
    );
  }

  // Sign in with Google function
  Future<void> _signInWithGoogle(AuthService authController) async {
    final result = await authController.signInWithGoogle();

    if (!result.success && result.error != null) {
      SnackToasts.errorSnackBar(
        title: 'Sign In Failed',
        message: result.error!,
      );
    }
  }
}


/*          */