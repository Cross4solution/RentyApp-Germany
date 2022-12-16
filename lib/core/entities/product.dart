import 'dart:convert';

import 'package:rent_app_germany/core/entities/user.dart';

import '../_core_exports.dart';

class Products {
  Products({
    required this.id,
    required this.productName,
    required this.price,
    required this.rentalPrice,
    required this.productImages,
    required this.categoryName,
    required this.userUsername,
  });

  final int id;
  final String productName;
  final int price;
  final int rentalPrice;
  final File productImages;
  final String categoryName;
  final String userUsername;

  factory Products.fromJson(String str) => Products.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Products.fromMap(Map<String, dynamic> json) => Products(
        id: json["id"],
        productName: json["product_name"],
        price: json["price"],
        rentalPrice: json["rental_price"],
        productImages: json["product_images"],
        categoryName: json["category_name"],
        userUsername: json["user_username"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "product_name": productName,
        "price": price,
        "rental_price": rentalPrice,
        "product_images": productImages,
        "category_name": categoryName,
        "user_username": userUsername,
      };
}
