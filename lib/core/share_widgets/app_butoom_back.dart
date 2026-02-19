import 'package:bookia_store/core/utils/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppButtonBack extends StatelessWidget {
  const AppButtonBack({super.key});

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: () => Navigator.pop(context),
    child: Container(
      width: 41.w,
      height: 41.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Center(
        child: SvgPicture.asset(Assets.icons.back, width: 24.w, height: 24.h),
      ),
    ),
  );
}
