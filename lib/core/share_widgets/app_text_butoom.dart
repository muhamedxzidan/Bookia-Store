import 'package:flutter/material.dart';

class AppTextButoom extends StatelessWidget {
  const AppTextButoom({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) =>
      TextButton(onPressed: () {}, child: Text(text));
}
