import 'package:bookia_store/features/home/data/models/best_seller_model.dart';

class WishlistModel {
  WishlistModel.fromJson(Map<String, dynamic> json) {
    message = json['message']?.toString();
    status = json['status'] is int
        ? json['status'] as int
        : int.tryParse(json['status']?.toString() ?? '');

    final rawData = json['data'];
    data = rawData is Map<String, dynamic>
        ? WishlistData.fromJson(rawData)
        : null;
  }

  WishlistData? data;
  String? message;
  int? status;
}

class WishlistData {
  WishlistData.fromJson(Map<String, dynamic> json) {
    final rawProducts = json['products'];
    if (rawProducts is Iterable) {
      products = <BookProduct>[];
      for (final item in rawProducts) {
        if (item is Map<String, dynamic>) {
          products!.add(BookProduct.fromJson(item));
        }
      }
    }
  }

  List<BookProduct>? products;
}
