import 'package:bookia_store/core/theme/app_colors.dart';
import 'package:bookia_store/core/theme/app_strings.dart';
import 'package:bookia_store/core/utils/assets.gen.dart';
import 'package:bookia_store/core/share_widgets/app_butoom.dart';
import 'package:bookia_store/features/auth/Presentation/login_screen.dart';
import 'package:bookia_store/features/auth/Presentation/register_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Assets.images.background.image().image,
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 22.h),
                child: IconButton(
                  onPressed: () {
                    if (context.locale.languageCode == 'en') {
                      context.setLocale(const Locale('ar'));
                    } else {
                      context.setLocale(const Locale('en'));
                    }
                  },
                  icon: const Icon(
                    Icons.language,
                    color: AppColors.primaryColor,
                  ),
                  iconSize: 32.sp,
                ),
              ),
            ),
            SizedBox(height: 75.h),
            Image(image: Assets.images.logo.image().image),
            SizedBox(height: 20.h),
            Text(
              AppStrings.orderBookNow.tr(),
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: AppButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    // ignore: inference_failure_on_instance_creation
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                color: AppColors.primaryColor,
                title: AppStrings.login.tr(),
              ),
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: AppButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    // ignore: inference_failure_on_instance_creation
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen(),
                    ),
                  );
                },
                color: AppColors.secondaryColor,
                title: AppStrings.register.tr(),
              ),
            ),
            SizedBox(height: 94.h),
          ],
        ),
      ),
    ),
  );
}
