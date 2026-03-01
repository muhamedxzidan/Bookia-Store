import 'package:dio/dio.dart';

class DioHelper {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://codingarabic.online/api',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
    ),
  );
}
