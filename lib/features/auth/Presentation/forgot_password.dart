import 'package:bookia_store/core/share_widgets/app_butoom.dart';
import 'package:bookia_store/core/share_widgets/app_butoom_back.dart';
import 'package:bookia_store/core/share_widgets/app_text_form_fild.dart';
import 'package:bookia_store/core/theme/app_colors.dart';
import 'package:bookia_store/core/theme/app_strings.dart';
import 'package:bookia_store/features/auth/Presentation/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h),
              const AppButtonBack(),
              SizedBox(height: 30.h),
              Text(
                AppStrings.hintTextForgotPassword,
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              Text(
                AppStrings.hintTextdescriptionForgotPassword,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.hintTextDescriptionColor,
                ),
              ),
              SizedBox(height: 30.h),
              const AppTextFormFild(
                color: AppColors.hintTextColor,
                hintText: AppStrings.hintTextEmail,
              ),
              SizedBox(height: 30.h),
              AppButton(
                AppTextStyle: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.secondaryColor,
                ),
                onPressed: () {},
                title: AppStrings.sendCode,
                color: AppColors.primaryColor,
              ),
              SizedBox(height: 361.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.rememberPassword,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.hintTextDescriptionColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        // ignore: inference_failure_on_instance_creation
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      AppStrings.login,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
