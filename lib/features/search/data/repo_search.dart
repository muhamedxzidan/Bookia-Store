import 'package:bookia_store/core/service/dio_helper.dart';
import 'package:bookia_store/core/utils/api_const.dart';
import 'package:bookia_store/features/home/data/models/best_seller_model.dart';
import 'package:flutter/material.dart';

class RepoSearch {
  const RepoSearch._();

  static Future<List<BookProduct>?> search(String keyword) async {
    try {
      // ignore: inference_failure_on_function_invocation
      final response = await DioHelper.dio.get(
        ApiConst.searchEndpoint,
        queryParameters: {'keyword': keyword},
      );
      if (response.statusCode == 200 && response.data != null) {
        final model = BestSellerModel.fromJson(response.data!);
        return model.data?.products ?? <BookProduct>[];
      }
      debugPrint(response.data.toString());
      return null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}