import 'package:bookia_store/core/service/dio_helper.dart';
import 'package:bookia_store/core/utils/api_const.dart';
import 'package:bookia_store/features/cart/data/models/cart_model.dart';
import 'package:flutter/foundation.dart';

class CartRepo {
  static Future<CartModel?> getCart() async {
    try {
      // ignore: inference_failure_on_function_invocation
      final response = await DioHelper.dio.get(ApiConst.showCartEndpoint);

      if (response.statusCode == 200 && response.data != null) {
        return CartModel.fromJson(response.data as Map<String, dynamic>);
      } else {
        debugPrint('===> GetCart Error: ${response.data}');
        return null;
      }
    } catch (e) {
      debugPrint('===> GetCart Exception: $e');
      return null;
    }
  }

  static Future<bool> addToCart(int productId) async {
    try {
      // ignore: inference_failure_on_function_invocation
      final response = await DioHelper.dio.post(
        ApiConst.addToCartEndpoint,
        data: {'product_id': productId},
      );

      final code = response.statusCode ?? 0;
      return code >= 200 && code < 300;
    } catch (e) {
      debugPrint('===> AddToCart Error: $e');
      return false;
    }
  }

  static Future<bool> removeFromCart(int cartItemId) async {
    try {
      // ignore: inference_failure_on_function_invocation
      final response = await DioHelper.dio.post(
        ApiConst.removeFromCartEndpoint,
        data: {'cart_item_id': cartItemId},
      );
      final code = response.statusCode ?? 0;
      return code >= 200 && code < 300;
    } catch (e) {
      debugPrint('===> RemoveFromCart Error: $e');
      return false;
    }
  }

  static Future<bool> updateCartItem({
    required int cartItemId,
    required int quantity,
  }) async {
    try {
      // ignore: inference_failure_on_function_invocation
      final response = await DioHelper.dio.post(
        ApiConst.updateCartEndpoint,
        data: {
          'cart_item_id': cartItemId,
          'quantity': quantity,
        },
      );
      final code = response.statusCode ?? 0;
      return code >= 200 && code < 300;
    } catch (e) {
      debugPrint('===> UpdateCartItem Error: $e');
      return false;
    }
  }
}
