import 'package:flutter/material.dart';
import '../../core/constants/images.dart';
import '../../models/salesum_type.dart';

class EmptyStateWidget extends StatelessWidget {
  final SalesumType type;

  const EmptyStateWidget({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImagesPaths.comeBackLaterIllustration, height: 100),
          const SizedBox(height: 16),
          Text(
            type == SalesumType.sales ? 'No sales records found' : 'No purchase records found',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Pull down to refresh or come back later',
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
