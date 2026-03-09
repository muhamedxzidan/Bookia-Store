import 'package:bookia_store/core/utils/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          SvgPicture.asset(Assets.icons.logo, width: 24.w, height: 24.h),

          SizedBox(width: 7.w),
        ],
      ),
      SvgPicture.asset(Assets.icons.search, width: 24.w),
    ],
  );
}
