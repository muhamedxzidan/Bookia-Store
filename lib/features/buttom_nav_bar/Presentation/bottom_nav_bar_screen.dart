import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bookia_store/core/utils/assets.gen.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('bokia store')),
    body: BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(Assets.icons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(Assets.icons.bookmark),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(Assets.icons.cart),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(Assets.icons.email),
          label: '',
        ),
      ],
    ),
  );
}
