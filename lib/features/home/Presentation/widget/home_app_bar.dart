import 'package:bookia_store/core/theme/app_colors.dart';
import 'package:bookia_store/core/theme/app_strings.dart';
import 'package:bookia_store/core/utils/assets.gen.dart';
import 'package:easy_localization/easy_localization.dart';
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
          SvgPicture.asset(Assets.icons.logo, width: 20.w),
          SizedBox(width: 7.w),
          Text(
            AppStrings.homeBrandName.tr(),
            style: TextStyle(
              fontFamily: 'DM Serif Display',
              fontSize: 22.sp,
              color: AppColors.darkTextColor,
            ),
          ),
        ],
      ),
      SvgPicture.asset(Assets.icons.search, width: 24.w),
    ],
  );
}
