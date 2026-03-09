import 'package:bookia_store/core/utils/api_const.dart';
import 'package:bookia_store/core/utils/token_key_secuer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DioHelper {
  DioHelper._();

  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConst.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  static bool _isInitialized = false;

  static Dio get dio {
    if (!_isInitialized) {
      _init();
    }
    return _dio;
  }

  static void _init() {
    _dio.interceptors.addAll([
      _AuthInterceptor(),
      if (kDebugMode) _LoggingInterceptor(),
    ]);
    _isInitialized = true;
  }
}

/// Interceptor that attaches the auth token to every request.
class _AuthInterceptor extends Interceptor {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _storage.read(key: TokenKeySecuer.tokenKey);
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}

/// Interceptor that logs requests and responses in debug mode.
class _LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('──── Request ────');
    debugPrint('${options.method} ${options.uri}');
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    debugPrint('──── Response ────');
    debugPrint('${response.statusCode} ${response.requestOptions.uri}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('──── Error ────');

    debugPrint('${err.type}: ${err.message}');
    handler.next(err);
  }
}
