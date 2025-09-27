import 'package:flutter/material.dart';

import '../theme.dart';

class TChipTheme {
  TChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    checkmarkColor: MaterialTheme.lightScheme().surface,
    selectedColor: MaterialTheme.lightScheme().primary,
    disabledColor: MaterialTheme.lightScheme().onSurface.withAlpha(40),
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    labelStyle: TextStyle(color: MaterialTheme.lightScheme().onSurface, fontFamily: 'Urbanist'),
  );

  static ChipThemeData darkChipTheme = ChipThemeData(
    checkmarkColor: MaterialTheme.darkScheme().surface,
    selectedColor: MaterialTheme.darkScheme().primary,
    disabledColor: MaterialTheme.darkScheme().onSurface.withAlpha(40),
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    labelStyle: TextStyle(color: MaterialTheme.darkScheme().onSurface, fontFamily: 'Urbanist'),
  );
}
