import 'package:bookia_store/core/utils/api_const.dart';
import 'package:bookia_store/core/utils/token_key_secuer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepo {
  static final Dio _dio = Dio();

  static Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        ApiConst.loginEndpoint,
        data: {'email': email, 'password': password},
      );
      if (response.statusCode == 200 && response.data != null) {
        // Save the token securely using flutter_secure_storage
        await saveTokenSecurely(response.data!["data"]["token"].toString());
        debugPrint("Token saved successfully");
        return true;

        // Save the token using shared_preferences (not recommended for sensitive data)

        // await saveToken(response.data!["data"]["token"].toString());
        //debugPrint("Token saved successfully");
        // return true;
      } else {
        debugPrint(response.data.toString());
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  static Future<bool> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String address,
    required String city,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        ApiConst.registerEndpoint,
        data: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': passwordConfirmation,
          'address': address,
          'city': city,
        },
      );
      if (response.statusCode == 201 || response.statusCode != null) {
        debugPrint(response.data.toString());
        return true;
      } else {
        debugPrint(response.data.toString());
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  static Future<void> saveTokenSecurely(String token) async {
    final storage = const FlutterSecureStorage();
    await storage.write(key: TokenKeySecuer.tokenKey, value: token);
  }

  //static Future<String> saveToken(String token) async {
  //final SharedPreferences prefs = await SharedPreferences.getInstance();
  //prefs.setString(SharedPrefConst.tokenKey, token);
  // return token;
  //}
}
