import 'package:bookia_store/core/utils/shared_pref_const.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:bookia_store/bookia_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ignore: depend_on_referenced_packages

void main() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  //prefs.remove(
  //SharedPrefConst.tokenKey,
  //); // Remove the token for testing purposes
  final String token = prefs.getString(SharedPrefConst.tokenKey) ?? '';

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) => EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: BookiaStore(token: token),
      ),
    ),
  );
}
