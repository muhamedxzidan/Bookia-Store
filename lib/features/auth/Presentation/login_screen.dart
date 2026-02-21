import 'package:bookia_store/core/share_widgets/app_butoom.dart';
import 'package:bookia_store/core/share_widgets/app_text_form_fild.dart';
import 'package:bookia_store/core/theme/app_colors.dart';
import 'package:bookia_store/core/theme/app_strings.dart';
import 'package:bookia_store/core/share_widgets/app_butoom_back.dart';
import 'package:bookia_store/core/utils/assets.gen.dart';
import 'package:bookia_store/features/auth/Presentation/forgot_password.dart';
import 'package:bookia_store/features/auth/Presentation/register_screen.dart';
import 'package:easy_localization/easy_localization.dart';
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
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 22.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppButtonBack(),
              SizedBox(height: 29.h),
              Text(
                AppStrings.titleLogin.tr(),
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 32.h),
              AppTextFormFild(
                color: AppColors.hintTextColor,
                hintText: AppStrings.hintTextEmail.tr(),
              ),
              SizedBox(height: 15.h),
              AppTextFormFild(
                color: AppColors.hintTextColor,
                hintText: AppStrings.hintTextPassword.tr(),
                isPassword: isPassword = true,
                svgPicture: SvgPicture.asset(Assets.icons.eye),
              ),
              SizedBox(height: 13.h),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    // ignore: inference_failure_on_instance_creation
                    MaterialPageRoute(
                      builder: (context) => const ForgotPassword(),
                    ),
                  );
                },
                child: Text(AppStrings.forgotPassword.tr()),
              ),
              SizedBox(height: 13.h),
              AppButton(
                onPressed: () {},
                color: AppColors.primaryColor,
                title: AppStrings.login.tr(),
              ),
              SizedBox(height: 34.h),
              const Divider(),
              Center(child: Text(AppStrings.or.tr())),
              SizedBox(height: 34.h),
              InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.icons.google),
                    SizedBox(width: 10.w),
                    Text(AppStrings.loginWithGoogle.tr()),
                  ],
                ),
              ),
              SizedBox(height: 34.h),
              InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.icons.apple),
                    SizedBox(width: 10.w),
                    Text(AppStrings.loginWithApple.tr()),
                  ],
                ),
              ),

              SizedBox(height: 34.h),

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
                    child: Text(AppStrings.dontHaveAccount.tr()),
                  ),
                  Text(
                    AppStrings.registerNow.tr(),
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
    ),
  );
}
