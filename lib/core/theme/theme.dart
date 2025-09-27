import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff1c6b50),
      surfaceTint: Color(0xff1c6b50),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffa7f2d1),
      onPrimaryContainer: Color(0xff00513b),
      secondary: Color(0xff755b0b),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffdf95),
      onSecondaryContainer: Color(0xff594400),
      tertiary: Color(0xff3e6374),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffc2e8fc),
      onTertiaryContainer: Color(0xff254b5c),
      error: Color(0xff904a43),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff73332d),
      surface: Color(0xfff5fbf5),
      onSurface: Color(0xff171d1a),
      onSurfaceVariant: Color(0xff404944),
      outline: Color(0xff707974),
      outlineVariant: Color(0xffbfc9c2),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c322e),
      inversePrimary: Color(0xff8bd6b5),
      primaryFixed: Color(0xffa7f2d1),
      onPrimaryFixed: Color(0xff002116),
      primaryFixedDim: Color(0xff8bd6b5),
      onPrimaryFixedVariant: Color(0xff00513b),
      secondaryFixed: Color(0xffffdf95),
      onSecondaryFixed: Color(0xff251a00),
      secondaryFixedDim: Color(0xffe6c36c),
      onSecondaryFixedVariant: Color(0xff594400),
      tertiaryFixed: Color(0xffc2e8fc),
      onTertiaryFixed: Color(0xff001f2a),
      tertiaryFixedDim: Color(0xffa6cce0),
      onTertiaryFixedVariant: Color(0xff254b5c),
      surfaceDim: Color(0xffd6dbd6),
      surfaceBright: Color(0xfff5fbf5),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f0),
      surfaceContainer: Color(0xffeaefea),
      surfaceContainerHigh: Color(0xffe4eae4),
      surfaceContainerHighest: Color(0xffdee4df),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003f2c),
      surfaceTint: Color(0xff1c6b50),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff2e7a5f),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff453400),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff85691c),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff123a4a),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff4d7283),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff5e231e),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffa25851),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff5fbf5),
      onSurface: Color(0xff0d1210),
      onSurfaceVariant: Color(0xff2f3833),
      outline: Color(0xff4b554f),
      outlineVariant: Color(0xff666f6a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c322e),
      inversePrimary: Color(0xff8bd6b5),
      primaryFixed: Color(0xff2e7a5f),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff0b6147),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff85691c),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff6a5100),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff4d7283),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff34596a),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc2c8c3),
      surfaceBright: Color(0xfff5fbf5),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f0),
      surfaceContainer: Color(0xffe4eae4),
      surfaceContainerHigh: Color(0xffd8ded9),
      surfaceContainerHighest: Color(0xffcdd3ce),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003324),
      surfaceTint: Color(0xff1c6b50),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff00543d),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff392a00),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff5c4600),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff033040),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff284e5e),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff511a15),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff763630),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff5fbf5),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff252e2a),
      outlineVariant: Color(0xff424b46),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c322e),
      inversePrimary: Color(0xff8bd6b5),
      primaryFixed: Color(0xff00543d),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003b29),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff5c4600),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff413000),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff284e5e),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff0d3747),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb4bab5),
      surfaceBright: Color(0xfff5fbf5),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffecf2ed),
      surfaceContainer: Color(0xffdee4df),
      surfaceContainerHigh: Color(0xffd0d6d1),
      surfaceContainerHighest: Color(0xffc2c8c3),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff8bd6b5),
      surfaceTint: Color(0xff8bd6b5),
      onPrimary: Color(0xff003827),
      primaryContainer: Color(0xff00513b),
      onPrimaryContainer: Color(0xffa7f2d1),
      secondary: Color(0xffe6c36c),
      onSecondary: Color(0xff3e2e00),
      secondaryContainer: Color(0xff594400),
      onSecondaryContainer: Color(0xffffdf95),
      tertiary: Color(0xffa6cce0),
      onTertiary: Color(0xff093544),
      tertiaryContainer: Color(0xff254b5c),
      onTertiaryContainer: Color(0xffc2e8fc),
      error: Color(0xffffb4ab),
      onError: Color(0xff561e19),
      errorContainer: Color(0xff73332d),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff0f1512),
      onSurface: Color(0xffdee4df),
      onSurfaceVariant: Color(0xffbfc9c2),
      outline: Color(0xff89938d),
      outlineVariant: Color(0xff404944),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee4df),
      inversePrimary: Color(0xff1c6b50),
      primaryFixed: Color(0xffa7f2d1),
      onPrimaryFixed: Color(0xff002116),
      primaryFixedDim: Color(0xff8bd6b5),
      onPrimaryFixedVariant: Color(0xff00513b),
      secondaryFixed: Color(0xffffdf95),
      onSecondaryFixed: Color(0xff251a00),
      secondaryFixedDim: Color(0xffe6c36c),
      onSecondaryFixedVariant: Color(0xff594400),
      tertiaryFixed: Color(0xffc2e8fc),
      onTertiaryFixed: Color(0xff001f2a),
      tertiaryFixedDim: Color(0xffa6cce0),
      onTertiaryFixedVariant: Color(0xff254b5c),
      surfaceDim: Color(0xff0f1512),
      surfaceBright: Color(0xff343b37),
      surfaceContainerLowest: Color(0xff0a0f0d),
      surfaceContainerLow: Color(0xff171d1a),
      surfaceContainer: Color(0xff1b211e),
      surfaceContainerHigh: Color(0xff252b28),
      surfaceContainerHighest: Color(0xff303633),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffa0eccb),
      surfaceTint: Color(0xff8bd6b5),
      onPrimary: Color(0xff002c1e),
      primaryContainer: Color(0xff559e81),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffdd87f),
      onSecondary: Color(0xff312400),
      secondaryContainer: Color(0xffac8d3d),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffbce2f6),
      onTertiary: Color(0xff002938),
      tertiaryContainer: Color(0xff7196a8),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cd),
      onError: Color(0xff481310),
      errorContainer: Color(0xffcc7b72),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0f1512),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd5dfd8),
      outline: Color(0xffabb4ae),
      outlineVariant: Color(0xff89938c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee4df),
      inversePrimary: Color(0xff00533c),
      primaryFixed: Color(0xffa7f2d1),
      onPrimaryFixed: Color(0xff00150d),
      primaryFixedDim: Color(0xff8bd6b5),
      onPrimaryFixedVariant: Color(0xff003f2c),
      secondaryFixed: Color(0xffffdf95),
      onSecondaryFixed: Color(0xff181000),
      secondaryFixedDim: Color(0xffe6c36c),
      onSecondaryFixedVariant: Color(0xff453400),
      tertiaryFixed: Color(0xffc2e8fc),
      onTertiaryFixed: Color(0xff00131c),
      tertiaryFixedDim: Color(0xffa6cce0),
      onTertiaryFixedVariant: Color(0xff123a4a),
      surfaceDim: Color(0xff0f1512),
      surfaceBright: Color(0xff404642),
      surfaceContainerLowest: Color(0xff040806),
      surfaceContainerLow: Color(0xff191f1c),
      surfaceContainer: Color(0xff232926),
      surfaceContainerHigh: Color(0xff2e3431),
      surfaceContainerHighest: Color(0xff393f3b),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffb8ffdf),
      surfaceTint: Color(0xff8bd6b5),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff87d2b2),
      onPrimaryContainer: Color(0xff000e08),
      secondary: Color(0xffffeecd),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffe1bf69),
      onSecondaryContainer: Color(0xff110a00),
      tertiary: Color(0xffdef3ff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffa2c8dc),
      onTertiaryContainer: Color(0xff000d14),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea5),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff0f1512),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffe9f2eb),
      outlineVariant: Color(0xffbbc5be),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee4df),
      inversePrimary: Color(0xff00533c),
      primaryFixed: Color(0xffa7f2d1),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff8bd6b5),
      onPrimaryFixedVariant: Color(0xff00150d),
      secondaryFixed: Color(0xffffdf95),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffe6c36c),
      onSecondaryFixedVariant: Color(0xff181000),
      tertiaryFixed: Color(0xffc2e8fc),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffa6cce0),
      onTertiaryFixedVariant: Color(0xff00131c),
      surfaceDim: Color(0xff0f1512),
      surfaceBright: Color(0xff4b514e),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1b211e),
      surfaceContainer: Color(0xff2c322e),
      surfaceContainerHigh: Color(0xff373d39),
      surfaceContainerHighest: Color(0xff424844),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.surface,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];


  static Color get scaffoldBgLight => const Color(0xFFE7EAED);
  static Color get scaffoldBgDark => const Color(0xFF1C1F22);
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
