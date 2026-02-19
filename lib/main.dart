import 'package:easy_localization/easy_localization.dart';
import 'package:bookia_store/bookia_store.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child:
      
       const BookiaStore(),
    ),
  );
}
