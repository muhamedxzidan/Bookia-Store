import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AuthRepo {
  static final Dio _dio = Dio();

  static Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        'https://codingarabic.online/api/login',
        data: {'email': email, 'password': password},
      );
      if (response.statusCode == 200) {
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
}
