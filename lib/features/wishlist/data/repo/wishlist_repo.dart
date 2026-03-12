import 'package:bookia_store/core/service/dio_helper.dart';
import 'package:bookia_store/core/utils/api_const.dart';
import 'package:bookia_store/features/wishlist/data/models/wishlist_model.dart';
import 'package:flutter/foundation.dart';

class WishlistRepo {
  static Future<WishlistModel?> getWishlist() async {
    try {
      // ignore: inference_failure_on_function_invocation
      final response = await DioHelper.dio.get(ApiConst.showWishlistEndpoint);
      if (response.statusCode == 200 && response.data != null) {
        return WishlistModel.fromJson(response.data as Map<String, dynamic>);
      } else {
        debugPrint(response.data.toString());
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  static Future<bool> addToWishlist(int productId) async {
    try {
      // ignore: inference_failure_on_function_invocation
      final response = await DioHelper.dio.post(
        ApiConst.addToWishlistEndpoint,
        data: {'product_id': productId},
      );
      final code = response.statusCode ?? 0;
      return code >= 200 && code < 300;
    } catch (e) {
      debugPrint('===> addToWishlist Error: $e');
      return false;
    }
  }

  static Future<bool> removeFromWishlist(int productId) async {
    try {
      // ignore: inference_failure_on_function_invocation
      final response = await DioHelper.dio.post(
        ApiConst.removeFromWishlistEndpoint,
        data: {'product_id': productId},
      );
      final code = response.statusCode ?? 0;
      return code >= 200 && code < 300;
    } catch (e) {
      debugPrint('===> removeFromWishlist Error: $e');
      return false;
    }
  }
}
