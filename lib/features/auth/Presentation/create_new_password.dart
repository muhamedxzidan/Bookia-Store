import 'package:bookia_store/core/share_widgets/app_butoom.dart';
import 'package:bookia_store/core/share_widgets/app_butoom_back.dart';
import 'package:bookia_store/core/share_widgets/app_text_form_fild.dart';
import 'package:bookia_store/core/theme/app_colors.dart';
import 'package:bookia_store/core/theme/app_strings.dart';
import 'package:bookia_store/core/utils/assets.gen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  bool isPassword = true;
  bool isConfirmPassword = true;

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 22.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppButtonBack(),
              SizedBox(height: 28.h),
              Text(
                AppStrings.titleCreateNewPassword.tr(),
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              Text(
                AppStrings.descriptionCreateNewPassword.tr(),
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.hintTextDescriptionColor,
                ),
              ),
              SizedBox(height: 32.h),
              AppTextFormFild(
                color: AppColors.hintTextColor,
                hintText: AppStrings.hintTextNewPassword.tr(),
                isPassword: isPassword,
                svgPicture: SvgPicture.asset(Assets.icons.eye),
              ),
              SizedBox(height: 15.h),
              AppTextFormFild(
                color: AppColors.hintTextColor,
                hintText: AppStrings.hintTextConfirmPassword.tr(),
                isPassword: isConfirmPassword,
                svgPicture: SvgPicture.asset(Assets.icons.eye),
              ),
              SizedBox(height: 35.h),
              AppButton(
                color: AppColors.primaryColor,
                AppTextStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                title: AppStrings.resetPassword.tr(),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
