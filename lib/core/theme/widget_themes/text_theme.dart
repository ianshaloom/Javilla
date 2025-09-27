import 'package:flutter/material.dart';

import '../theme.dart';

/// Custom Class for Light & Dark Text Themes
class TTextTheme {
  TTextTheme._(); // To avoid creating instances

  /// Customizable Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: MaterialTheme.lightScheme().onSurface,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: MaterialTheme.lightScheme().onSurface,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: MaterialTheme.lightScheme().onSurface,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: MaterialTheme.lightScheme().onSurface,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: MaterialTheme.lightScheme().onSurface.withAlpha(40),
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: MaterialTheme.lightScheme().onSurface.withAlpha(40),
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: MaterialTheme.lightScheme().onSurface,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: MaterialTheme.lightScheme().onSurface,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: MaterialTheme.lightScheme().onSurface.withAlpha(40),
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: MaterialTheme.lightScheme().onSurface,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: MaterialTheme.lightScheme().onSurface.withAlpha(40),
    ),
  );

  /// Customizable Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: MaterialTheme.darkScheme().onSurface,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: MaterialTheme.darkScheme().onSurface,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: MaterialTheme.darkScheme().onSurface,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: MaterialTheme.darkScheme().onSurface,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: MaterialTheme.darkScheme().onSurface,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: MaterialTheme.darkScheme().onSurface,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: MaterialTheme.darkScheme().onSurface,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: MaterialTheme.darkScheme().onSurface,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: MaterialTheme.darkScheme().onSurface.withAlpha(50),
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: MaterialTheme.darkScheme().onSurface,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: MaterialTheme.darkScheme().onSurface.withAlpha(150),
    ),
  );
}
