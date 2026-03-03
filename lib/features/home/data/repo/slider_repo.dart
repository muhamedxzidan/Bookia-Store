import 'package:bookia_store/core/utils/api_const.dart';
import 'package:bookia_store/features/home/data/models/slider_models.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeRepo {
  static final Dio _dio = Dio();

  static Future<SliderModel?> getHomeSliders() async {
    try {
      // ignore: inference_failure_on_function_invocation
      final response = await _dio.get(ApiConst.slidersEndPoint);
      if (response.statusCode == 200 && response.data != null) {
        return SliderModel.fromJson(response.data!);
      } else {
        debugPrint(response.data.toString());
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
