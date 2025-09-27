import 'package:flutter/material.dart';

import '../theme.dart';
import '../../constants/sizes.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: MaterialTheme.lightScheme().onSurface.withAlpha(40),
    suffixIconColor: MaterialTheme.lightScheme().onSurface.withAlpha(40),
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(
        fontSize: TSizes.fontSizeMd,
        color: MaterialTheme.lightScheme().onSurface,
        fontFamily: 'Urbanist'),
    hintStyle: const TextStyle().copyWith(
        fontSize: TSizes.fontSizeSm,
        color: MaterialTheme.lightScheme().onSurface.withAlpha(40),
        fontFamily: 'Urbanist'),
    errorStyle: const TextStyle()
        .copyWith(fontStyle: FontStyle.normal, fontFamily: 'Urbanist'),
    floatingLabelStyle: const TextStyle()
        .copyWith(color: MaterialTheme.lightScheme().onSurface.withAlpha(40), fontFamily: 'Urbanist'),
    border:  const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide:  BorderSide(width: 1, color: MaterialTheme.lightScheme().primary),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide:  BorderSide(width: 1, color: MaterialTheme.lightScheme().primary),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide:  BorderSide(width: 1, color: MaterialTheme.lightScheme().primary),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide:  BorderSide(width: 1, color: MaterialTheme.lightScheme().error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide:  BorderSide(width: 2, color: MaterialTheme.lightScheme().error),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: MaterialTheme.darkScheme().onSurface.withAlpha(40),
    suffixIconColor: MaterialTheme.darkScheme().onSurface.withAlpha(40),
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(
        fontSize: TSizes.fontSizeMd,
        color: MaterialTheme.darkScheme().onSurface,
        fontFamily: 'Urbanist'),
    hintStyle: const TextStyle().copyWith(
        fontSize: TSizes.fontSizeSm,
        color: MaterialTheme.darkScheme().onSurface.withAlpha(40),
        fontFamily: 'Urbanist'),
    floatingLabelStyle: const TextStyle()
        .copyWith(color: MaterialTheme.darkScheme().onSurface.withAlpha(40), fontFamily: 'Urbanist'),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide:  BorderSide(width: 1, color: MaterialTheme.darkScheme().primary),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide:  BorderSide(width: 1, color: MaterialTheme.darkScheme().primary),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide:  BorderSide(width: 1, color: MaterialTheme.darkScheme().onSurface),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide:  BorderSide(width: 1, color: MaterialTheme.darkScheme().error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide:  BorderSide(width: 2, color: MaterialTheme.darkScheme().error),
    ),
  );
}
