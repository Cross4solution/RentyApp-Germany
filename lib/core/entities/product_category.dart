import 'dart:convert';

class CategoryModel {
    CategoryModel({
        this.status,
       required this.categories,
    });

    final bool? status;
    final List<CategoryArticles> categories;

    factory CategoryModel.fromJson(String str) => CategoryModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
        status: json["status"],
        categories: List<CategoryArticles>.from(json["categories"].map((x) => CategoryArticles.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "categories": List<dynamic>.from(categories.map((x) => x.toMap())),
    };
}

class CategoryArticles {
  CategoryArticles({
  this.id,
   this.name,
     this.image,
  });

  final int? id;
  final String? name;
  final dynamic image;

  factory CategoryArticles.fromJson(String str) =>
      CategoryArticles.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryArticles.fromMap(Map<String, dynamic> json) => CategoryArticles(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "image": image,
      };
}
