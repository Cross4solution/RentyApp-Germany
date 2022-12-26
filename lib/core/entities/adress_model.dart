import 'dart:convert';

class AdressModel {
  AdressModel({
    this.userLocation,
  });

  final List<UserLocation>? userLocation;

  factory AdressModel.fromJson(String str) =>
      AdressModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AdressModel.fromMap(Map<String, dynamic> json) => AdressModel(
        userLocation: List<UserLocation>.from(
            json["userLocation"].map((x) => UserLocation.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "userLocation": List<dynamic>.from(userLocation!.map((x) => x.toMap())),
      };
}

class UserLocation {
  UserLocation({
    this.id,
    required this.title,
    required this.city,
    required this.address,
    required this.postalCode,
  });

  final int? id;
  final String title;
  final String city;
  final String address;
  final String postalCode;

  factory UserLocation.fromJson(String str) =>
      UserLocation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserLocation.fromMap(Map<String, dynamic> json) => UserLocation(
        id: json["id"],
        title: json["title"],
        city: json["city"],
        address: json["address"],
        postalCode: json["postal_code"],
      );

  Map<String, dynamic> toMap() => {
        // "id": id, //gönderirken bu parametre kullanmayacağız o yüzden kaldırıldı
        "title": title,
        "city": city,
        "address": address,
        "postal_code": postalCode,
      };
}
