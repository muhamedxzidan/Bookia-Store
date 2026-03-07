import 'package:bookia_store/core/theme/app_colors.dart';
import 'package:bookia_store/core/utils/assets.gen.dart';
import 'package:bookia_store/features/cart/Presentation/cart_screen.dart';
import 'package:bookia_store/features/home/Presentation/home_screen.dart';
import 'package:bookia_store/features/home/cubit/home_cubit.dart';
import 'package:bookia_store/features/profile/Presentation/profile_screen.dart';
import 'package:bookia_store/features/wishlist/Presentation/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  List<Widget> screens = [
    BlocProvider(
      create: (context) => HomeCubit()
        ..getSliders()
        ..getBestSellers(),
      child: const HomeScreen(),
    ),
    const WishlistScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) => Scaffold(
    bottomNavigationBar: BottomNavigationBar(
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Assets.icons.home,
            colorFilter: _currentIndex == 0
                ? const ColorFilter.mode(
                    AppColors.primaryColor,
                    BlendMode.srcATop,
                  )
                : null,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Assets.icons.bookmark,

            colorFilter: _currentIndex == 1
                ? const ColorFilter.mode(
                    AppColors.primaryColor,
                    BlendMode.srcATop,
                  )
                : null,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Assets.icons.category,

            colorFilter: _currentIndex == 2
                ? const ColorFilter.mode(
                    AppColors.primaryColor,
                    BlendMode.srcATop,
                  )
                : null,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Assets.icons.profile,

            colorFilter: _currentIndex == 3
                ? const ColorFilter.mode(
                    AppColors.primaryColor,
                    BlendMode.srcATop,
                  )
                : null,
          ),
          label: '',
        ),
      ],
    ),
    body: SafeArea(child: screens[_currentIndex]),
  );
}
