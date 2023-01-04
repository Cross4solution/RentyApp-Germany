import 'dart:convert';

class ProductCategoryModel {
  ProductCategoryModel({
    required this.id,
    required this.image,
    required this.name,
  });

  final int id;
  final String image;
  final String name;

  factory ProductCategoryModel.fromJson(String str) =>
      ProductCategoryModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductCategoryModel.fromMap(Map<String, dynamic> json) =>
      ProductCategoryModel(
        id: json["id"],
        image: json["image"] ?? "",
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "image": image,
        "name": name,
      };
}
