import 'package:bookia_store/core/routing/app_routes.dart';
import 'package:bookia_store/core/routing/routes.dart';
import 'package:bookia_store/features/auth/Presentation/welcome_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookiaStore extends StatelessWidget {
  const BookiaStore({super.key, this.token = ""});
  final String token;

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
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: start(),
    ),
  );

  String start() => token.isEmpty ? Routes.login : Routes.home;
}
