import 'dart:convert';

class AuthData {
  final String name;
  final String email;

  AuthData({
    required this.name,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
    };
  }

  AuthData copyWith({
    String? name,
    String? email,
  }) {
    return AuthData(
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  factory AuthData.fromMap(Map<String, dynamic> map) {
    return AuthData(
      name: map['name'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthData.fromJson(String source) =>
      AuthData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AuthData(name: $name, email: $email)';

  @override
  bool operator ==(covariant AuthData other) {
    if (identical(this, other)) return true;

    return other.name == name && other.email == email;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode;
}
