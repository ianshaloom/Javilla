import 'package:flutter/material.dart';

class CustomFilledBtn extends StatelessWidget {
  final String title;
  final double? pad;
  final VoidCallback onPressed;

  const CustomFilledBtn({
    super.key,
    required this.title,
    required this.onPressed,
    this.pad,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(pad ?? 0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          minimumSize: const Size.fromHeight(50),
        ),
        child: Text(
          title,
        ),
      ),
    );
  }
}
