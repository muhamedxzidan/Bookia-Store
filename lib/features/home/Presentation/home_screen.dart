import 'package:bookia_store/core/utils/assets.gen.dart';
import 'package:bookia_store/features/home/Presentation/widget/home_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 12.w),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Assets.images.logo.image(width: 100.w),

            SvgPicture.asset(Assets.icons.search),
          ],
        ),
        SizedBox(height: 20.h),
        const HomeSlider(),
        SizedBox(height: 20.h),
      ],
    ),
  );
}
