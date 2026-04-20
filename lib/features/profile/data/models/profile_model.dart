class ProfileModel {
  ProfileModel.fromJson(Map<String, dynamic> json) {
    message = _asString(json['message']);
    status = _asInt(json['status']);

    final rawData = json['data'];
    data = rawData is Map<String, dynamic> ? ProfileData.fromJson(rawData) : null;
  }

  ProfileData? data;
  String? message;
  int? status;
}

class ProfileData {
  ProfileData.fromJson(Map<String, dynamic> json) {
    final rawUser = json['user'];
    user = rawUser is Map<String, dynamic> ? UserProfile.fromJson(rawUser) : null;
  }

  UserProfile? user;
}

class UserProfile {
  UserProfile({this.id, this.name, this.email, this.image, this.phone});

  UserProfile.fromJson(Map<String, dynamic> json) {
    id = _asInt(json['id']);
    name = _asString(json['name']);
    email = _asString(json['email']);
    image = _asString(json['image']);
    phone = _asString(json['phone']);
  }

  int? id;
  String? name;
  String? email;
  String? image;
  String? phone;
}

int? _asInt(dynamic value) {
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value);
  return null;
}

String? _asString(dynamic value) => value is String ? value : null;
