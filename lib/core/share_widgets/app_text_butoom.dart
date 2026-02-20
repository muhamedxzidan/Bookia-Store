import 'package:flutter/material.dart';

class AppTextButoom extends StatelessWidget {
  const AppTextButoom({super.key, required this.text, this.onPressed});

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) =>
      TextButton(onPressed: onPressed, child: Text(text));
}
