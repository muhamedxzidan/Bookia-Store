import 'package:bookia_store/features/home/Presentation/widget/book_grid_view.dart';
import 'package:bookia_store/features/home/Presentation/widget/home_app_bar.dart';
import 'package:bookia_store/features/home/Presentation/widget/home_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HomeAppBar(),
        SizedBox(height: 22.h),
        const HomeSlider(),
        SizedBox(height: 24.h),
        const BookGridView(),
        SizedBox(height: 12.h),
      ],
    ),
  );
}
