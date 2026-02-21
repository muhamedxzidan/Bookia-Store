import 'package:bookia_store/features/auth/Presentation/create_new_password.dart';
import 'package:bookia_store/features/auth/Presentation/forgot_password.dart';
import 'package:bookia_store/features/auth/Presentation/otp_verification.dart';
import 'package:bookia_store/features/auth/Presentation/password_changed.dart';
import 'package:bookia_store/features/auth/Presentation/register_screen.dart';
import 'package:bookia_store/features/auth/Presentation/welcome_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookiaStore extends StatelessWidget {
  const BookiaStore({super.key});

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) => MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,

      home: const WelcomeScreen(),
    ),
  );
}
