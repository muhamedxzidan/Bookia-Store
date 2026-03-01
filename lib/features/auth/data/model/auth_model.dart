class AuthModel {
  AuthModel({required this.token, required this.name, required this.email});
  final String token;
  final String name;
  final String email;

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>? ?? {};
    final user = data['user'] as Map<String, dynamic>? ?? {};

    return AuthModel(
      token: (data['token'] ?? '').toString(),
      name: (user['name'] ?? '').toString(),
      email: (user['email'] ?? '').toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    'token': token,
    'name': name,
    'email': email,
  };
}
