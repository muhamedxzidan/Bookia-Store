import 'package:bookia_store/core/theme/app_colors.dart';
import 'package:bookia_store/core/utils/assets.gen.dart';
import 'package:bookia_store/core/widgets/app_butoom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
          SizedBox(height: 135.h),
          Image(image: Assets.images.logo.image().image),
          SizedBox(height: 20.h),
          Text(
            'Order Your Book Now!',
            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: AppButton(
              onPressed: () {},
              color: AppColors.primaryColor,
              title: 'Login',
            ),
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: AppButton(
              onPressed: () {},
              color: AppColors.secondaryColor,
              title: 'Register',
            ),
          ),
          SizedBox(height: 94.h),
        ],
      ),
    ),
  );
}
