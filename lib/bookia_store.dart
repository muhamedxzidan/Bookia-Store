import 'package:flutter/material.dart';

class BookiaStore extends StatelessWidget {
  const BookiaStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text('Bookia Store'),
        ),
      ),
    );
  }
}