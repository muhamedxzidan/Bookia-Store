import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => const SafeArea(
    child: Scaffold(body: Center(child: Text('Home Screen'))),
  );
}
