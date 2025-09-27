import 'package:flutter/material.dart';

import '../../constants/sizes.dart';

/// A container widget with rounded corners and customizable properties.
class OutlinedContainer extends StatelessWidget {
  /// Create a rounded container with customizable properties.
  ///
  /// Parameters:
  ///   - width: The width of the container.
  ///   - height: The height of the container.
  ///   - radius: The border radius for the rounded corners.
  ///   - padding: The padding inside the container.
  ///   - margin: The margin around the container.
  ///   - child: The widget to be placed inside the container.
  ///   - backgroundColor: The background color of the container.
  ///   - borderColor: The color of the container's border.
  ///   - showBorder: A flag to determine if the container should have a border.
  const OutlinedContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.margin,
    this.showBorder = false,
    this.padding = const EdgeInsets.all(TSizes.md),
    this.borderColor = const Color(0xFFEAECF0), // EAECF0
    this.radius = TSizes.cardRadiusLg,
    this.backgroundColor, // F9FAFB
    this.onTap,
  });

  final Widget? child;
  final double radius;
  final double? width;
  final double? height;
  final bool showBorder;
  final Color borderColor;
  final EdgeInsets? margin;
  final EdgeInsets padding;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline.withAlpha(80),
          ),
        ),
        child: child,
      ),
    );
  }
}
