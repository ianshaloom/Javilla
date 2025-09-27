import 'package:flutter/material.dart';

class CustomOutlinedBtn extends StatelessWidget {
  final String title;
  final double pad;
  final VoidCallback onPressed;

  const CustomOutlinedBtn({
    super.key,
    required this.title,
    required this.pad,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
      ),
      child: Text(
        title,
      ),
    );
  }
}
