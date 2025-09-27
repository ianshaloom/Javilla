import 'package:flutter/material.dart';

import '../../constants/images.dart';
import '../../constants/sizes.dart';

class EmptyContent extends StatelessWidget {
  const EmptyContent({super.key, required this.title, this.subtitle});
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // a small illustration image
          Image.asset(
            ImagesPaths.comeBackLaterIllustration,
            height: 100,
            width: 100,
          ),
          const SizedBox(height: TSizes.spaceBtwSections),

          // a message indicating no sales data
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(150),
                ),
          ),
          if (subtitle != null)
            Text(
              subtitle!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color:
                        Theme.of(context).colorScheme.onSurface.withAlpha(150),
                    fontStyle: FontStyle.italic,
                  ),
            ),
        ],
      ),
    );
  }
}
