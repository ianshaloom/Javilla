import 'package:flutter/material.dart';
import '../../constants/sizes.dart';
import '../theme.dart';

class TAppBarTheme {
  TAppBarTheme._();

  static final lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: MaterialTheme.lightScheme().surface,
    surfaceTintColor: MaterialTheme.lightScheme().surface,
    iconTheme: IconThemeData(color: MaterialTheme.lightScheme().primary, size: TSizes.iconMd),
    actionsIconTheme:
        IconThemeData(color: MaterialTheme.lightScheme().primary, size: TSizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: MaterialTheme.lightScheme().onSurface,
        fontFamily: 'Urbanist'),
  );
  
  static final darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: MaterialTheme.darkScheme().surface,
    surfaceTintColor: MaterialTheme.darkScheme().surface,
    iconTheme: IconThemeData(color: MaterialTheme.darkScheme().onSurface, size: TSizes.iconMd),
    actionsIconTheme: IconThemeData(color: MaterialTheme.darkScheme().onSurface, size: TSizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: MaterialTheme.darkScheme().onSurface,
        fontFamily: 'Urbanist'),
  );
}
