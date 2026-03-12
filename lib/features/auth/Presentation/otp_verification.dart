import 'package:bookia_store/core/share_widgets/app_butoom.dart';
import 'package:bookia_store/core/theme/app_colors.dart';
import 'package:bookia_store/core/theme/app_strings.dart';
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
                Text(
                  AppStrings.resendCode.tr(),
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.hintTextDescriptionColor,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // TODO: implement resend OTP code logic
                  },
                  child: Text(
                    AppStrings.resendCodeNow.tr(),
                    style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
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
