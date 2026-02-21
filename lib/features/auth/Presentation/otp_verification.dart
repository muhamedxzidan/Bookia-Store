import 'package:bookia_store/core/share_widgets/app_butoom.dart';
import 'package:bookia_store/core/share_widgets/app_butoom_back.dart';
import 'package:bookia_store/core/theme/app_colors.dart';
import 'package:bookia_store/core/theme/app_strings.dart';
import 'package:bookia_store/features/auth/Presentation/register_screen.dart';
import 'package:bookia_store/features/auth/Presentation/widgest/otp_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpVerification extends StatelessWidget {
  const OtpVerification({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppButtonBack(),
            SizedBox(height: 28.h),
            Text(
              AppStrings.otpVerification.tr(),
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            Text(
              AppStrings.otpVerificationDescription.tr(),
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.hintTextDescriptionColor,
              ),
            ),
            SizedBox(height: 35.h),
            const OtpWidget(),
            SizedBox(height: 35.h),
            AppButton(
              color: AppColors.primaryColor,
              AppTextStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              title: AppStrings.sendCode.tr(),
              onPressed: () {},
            ),
            SizedBox(height: 357.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      // ignore: inference_failure_on_instance_creation
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );
                  },
                  child: Text(AppStrings.resendCode.tr()),
                ),
                Text(
                  AppStrings.resendCodeNow.tr(),
                  style: const TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
