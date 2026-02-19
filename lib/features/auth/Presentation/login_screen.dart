import 'package:bookia_store/core/utils/assets.gen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Assets.images.background.image().image,
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 135),
            child: Image(image: Assets.images.logo.image().image),
          ),
        ],
      ),
    ),
  );
}
