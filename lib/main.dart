import 'package:bookia_store/core/utils/token_key_secuer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:bookia_store/bookia_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// ignore: depend_on_referenced_packages

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final storage = const FlutterSecureStorage();
  //await storage.delete(key: TokenKeySecuer.tokenKey,); // Remove the token for testing purposes
  final String token = await storage.read(key: TokenKeySecuer.tokenKey) ?? '';

  //final SharedPreferences prefs = await SharedPreferences.getInstance();
  //prefs.remove(
  //SharedPrefConst.tokenKey,
  //); // Remove the token for testing purposes
  //final String token = prefs.getString(SharedPrefConst.tokenKey) ?? '';

  //WidgetsFlutterBinding.ensureInitialized();

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
