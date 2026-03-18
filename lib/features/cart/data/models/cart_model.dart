import 'package:bookia_store/features/home/data/models/best_seller_model.dart';

class CartModel {
  CartModel.fromJson(Map<String, dynamic> json) {
    message = json['message']?.toString();
    status = json['status'] is int
        ? json['status'] as int
        : int.tryParse(json['status']?.toString() ?? '');

    final rawData = json['data'];
    if (rawData is Map<String, dynamic>) {
      data = CartData.fromJson(rawData);
    }
  }

  CartData? data;
  String? message;
  int? status;
}

class CartData {
  CartData.fromJson(Map<String, dynamic> json) {
    final rawItems = json['cart_items'] ?? json['items'] ?? json['data'];
    if (rawItems is Iterable) {
      cartItems = <CartItem>[];
      for (final item in rawItems) {
        if (item is Map<String, dynamic>) {
          cartItems!.add(CartItem.fromJson(item));
        }
      }
    }

    final rawTotal = json['total'];
    if (rawTotal is num) {
      total = rawTotal.toDouble();
    } else if (rawTotal is String) {
      total = double.tryParse(rawTotal);
    }
  }

  List<CartItem>? cartItems;
  double? total;
}

class CartItem {
  CartItem({this.id, this.product, this.quantity});

  CartItem.fromJson(Map<String, dynamic> json) {
    // API returns 'item_id' not 'id'
    id = _parseIntField(json['item_id'] ?? json['id']);

    // API returns flat product fields with 'item_product_' prefix
    final rawProduct = json['product'];
    if (rawProduct is Map<String, dynamic>) {
      product = BookProduct.fromJson(rawProduct);
    } else {
      // Build BookProduct from flat fields
      product = BookProduct(
        id: _parseIntField(json['item_product_id']),
        name: json['item_product_name']?.toString(),
        price: json['item_product_price']?.toString(),
        image: json['item_product_image']?.toString(),
      );
    }

    // API returns 'item_quantity' not 'quantity'
    quantity = _parseIntField(json['item_quantity'] ?? json['quantity']);
  }

  int? id;
  BookProduct? product;
  int? quantity;
}

int? _parseIntField(dynamic value) {
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value);
  return null;
}
