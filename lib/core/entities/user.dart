import '../_core_exports.dart';

class UserModel {
  UserModel({
     this.errorCode,
     this.accessToken,
     this.tokenType,
     this.user,
  });

  final int? errorCode;
  final String? accessToken;
  final String? tokenType;
  final User? user;

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        errorCode: json["error_code"],
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        user: User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "error_code": errorCode,
        "access_token": accessToken,
        "token_type": tokenType,
        "user": user?.toMap(),
      };
}

class User {
  User({
     this.uuid,
     this.name,
     required this.username,
     this.email,
     this.storeId,
     this.phoneNumber,
     this.isSeller,
     this.status,
     required this.password,
  });

  final String? uuid;
  final String? name;
  final String username;
  final String? email;
  final dynamic storeId;
  final String? phoneNumber;
  final bool? isSeller;
  final bool? status;
  final String password;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        uuid: json["uuid"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        storeId: json["store_id"],
        phoneNumber: json["phoneNumber"],
        isSeller: json["isSeller"],
        status: json["status"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        "uuid": uuid,
        "name": name,
        "username": username,
        "email": email,
        "store_id": storeId,
        "phoneNumber": phoneNumber,
        "isSeller": isSeller,
        "status": status,
        "password": password,
      };
}
