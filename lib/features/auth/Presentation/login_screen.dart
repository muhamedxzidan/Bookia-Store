import 'package:bookia_store/core/share_widgets/app_butoom.dart';
import 'package:bookia_store/core/share_widgets/app_text_form_fild.dart';
import 'package:bookia_store/core/theme/app_colors.dart';
import 'package:bookia_store/core/theme/app_strings.dart';
import 'package:bookia_store/core/share_widgets/app_butoom_back.dart';
import 'package:bookia_store/core/utils/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPassword = false;

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 22.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppButtonBack(),
            SizedBox(height: 29.h),
            Text(
              AppStrings.titleLogin,
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 32.h),
            const AppTextFormFild(hintText: AppStrings.hintTextEmail),
            SizedBox(height: 15.h),
            AppTextFormFild(
              hintText: AppStrings.hintTextPassword,
              obscureText: isPassword,
              svgPicture: SvgPicture.asset(Assets.icons.eye),
            ),
            SizedBox(height: 13.h),
            TextButton(
              onPressed: () {},
              child: const Text(AppStrings.forgotPassword),
            ),
            SizedBox(height: 13.h),
            AppButton(
              onPressed: () {},
              color: AppColors.primaryColor,
              title: AppStrings.login,
            ),
            SizedBox(height: 34.h),
            const Divider(),
            const Center(child: Text(AppStrings.or)),
            SizedBox(height: 34.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.icons.google),
                SizedBox(width: 10.w),
                const Text(AppStrings.loginWithGoogle),
              ],
            ),
            SizedBox(height: 34.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.icons.apple),
                SizedBox(width: 10.w),
                const Text(AppStrings.loginWithApple),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
