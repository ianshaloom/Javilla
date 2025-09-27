import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../helpers/helper_functions.dart';
import '../../theme/theme.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({
    super.key,
    required this.width,
    required this.height,
    this.radius = 15,
    this.color,
    this.margin,
  });

  final double width, height, radius;
  final Color? color;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        decoration: BoxDecoration(
          color:
              color ??
              (dark
                  ? MaterialTheme.darkScheme().onSurface.withAlpha(40)
                  : MaterialTheme.lightScheme().onSurface.withAlpha(40)),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
