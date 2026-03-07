class BestSellerModel {
  BestSellerModel.fromJson(Map<String, dynamic> json) {
    message = _asString(json['message']);
    status = _asInt(json['status']);

    final rawData = json['data'];
    data = rawData is Map<String, dynamic>
        ? BestSellerData.fromJson(rawData)
        : null;
  }

  BestSellerData? data;
  String? message;
  int? status;
}

class BestSellerData {
  BestSellerData.fromJson(Map<String, dynamic> json) {
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

class BookProduct {
  BookProduct({this.id, this.name, this.price, this.image});

  BookProduct.fromJson(Map<String, dynamic> json) {
    id = _asInt(json['id']);
    name = _asString(json['name']);
    price = json['price']?.toString();
    image = _asString(json['image']);
  }

  int? id;
  String? name;
  String? price;
  String? image;
}

int? _asInt(dynamic value) {
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value);
  return null;
}

String? _asString(dynamic value) => value is String ? value : null;
