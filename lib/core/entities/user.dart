import '../_core_exports.dart';

class UserModel {
  final String name;
  final String email;
  final String phoneNumber;
  final String username;
  final String password;
  final bool isSeller;

  UserModel({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.username,
    required this.password,
    required this.isSeller,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        name: map['name'],
        email: map['email'],
        phoneNumber: map['phoneNumber'],
        username: map['username'],
        password: map['password'],
        isSeller: map['isSeller'],
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'email': email,
        'phoneNumber': phoneNumber,
        'username': username,
        'password': password,
        'isSeller': isSeller,
      };

  String toJson() => json.encode(toMap());
}
