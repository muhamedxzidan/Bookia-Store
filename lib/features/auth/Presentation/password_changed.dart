import 'package:bookia_store/core/share_widgets/app_butoom.dart';
import 'package:bookia_store/core/theme/app_colors.dart';
import 'package:bookia_store/core/theme/app_strings.dart';
import 'package:bookia_store/core/utils/assets.gen.dart';
import 'package:bookia_store/features/auth/Presentation/login_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PasswordChanged extends StatelessWidget {
  const PasswordChanged({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 22.h),
        child: Column(
          children: [
            const Spacer(),
            SvgPicture.asset(Assets.icons.sucsses, width: 100.w, height: 100.h),
            SizedBox(height: 35.h),
            Text(
              AppStrings.passwordChanged.tr(),
              style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            Text(
              AppStrings.descriptionPasswordChanged.tr(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.sp,
                color: AppColors.hintTextDescriptionColor,
              ),
            ),
            SizedBox(height: 40.h),
            AppButton(
              color: AppColors.primaryColor,
              AppTextStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.secondaryColor,
              ),
              title: AppStrings.backToLogin.tr(),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  // ignore: inference_failure_on_instance_creation
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    ),
  );
}
