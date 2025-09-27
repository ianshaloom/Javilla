import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingWidget extends StatelessWidget {
  final String? message;
  final double size;
  final Color? color;

  const LoadingWidget({super.key, this.message, this.size = 40.0, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: LoadingAnimationWidget.fourRotatingDots(
              color: color ?? Theme.of(context).colorScheme.primary,
              size: size,
            ),
          ),
          if (message != null) ...[
            const SizedBox(height: 26),
            Text(message!, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
          ],
        ],
      ),
    );
  }
}
