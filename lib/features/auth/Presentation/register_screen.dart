import 'package:bookia_store/core/share_widgets/app_butoom.dart';
import 'package:bookia_store/core/share_widgets/app_butoom_back.dart';
import 'package:bookia_store/core/share_widgets/app_text_butoom.dart';
import 'package:bookia_store/core/share_widgets/app_text_form_fild.dart';
import 'package:bookia_store/core/theme/app_colors.dart';
import 'package:bookia_store/core/theme/app_strings.dart';
import 'package:bookia_store/features/auth/Presentation/login_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h),
              const AppButtonBack(),
              SizedBox(height: 28.h),
              Text(
                AppStrings.titleRegister.tr(),
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 32.h),
              AppTextFormFild(
                color: AppColors.hintTextColor,
                hintText: AppStrings.hintTextUserName.tr(),
              ),
              SizedBox(height: 15.h),
              AppTextFormFild(
                color: AppColors.hintTextColor,
                hintText: AppStrings.hintTextEmail.tr(),
              ),
              SizedBox(height: 15.h),
              AppTextFormFild(
                color: AppColors.hintTextColor,
                hintText: AppStrings.hintTextPassword.tr(),
              ),
              SizedBox(height: 15.h),
              AppTextFormFild(
                color: AppColors.hintTextColor,
                hintText: AppStrings.hintTextConfirmPassword.tr(),
              ),
              SizedBox(height: 30.h),
              AppButton(
                onPressed: () {},
                color: AppColors.primaryColor,
                title: AppStrings.register.tr(),
                AppTextStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 184.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTextButoom(
                    text: AppStrings.hintTextAlreadyHaveAccount.tr(),
                  ),
                  AppTextButoom(
                    text: AppStrings.loginNow.tr(),
                    onPressed: () {
                      Navigator.push(
                        context,
                        // ignore: inference_failure_on_instance_creation
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 27.h),
            ],
          ),
        ),
      ),
    ),
  );
}
