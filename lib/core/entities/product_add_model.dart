import 'dart:convert';

class ProductAddModel {
  ProductAddModel({
    this.name,
    this.description,
    this.price,
    this.rentalPrice,
    this.categoryId,
    this.features,
    this.isDamaged,
    this.productImages,
  });

  final String? name;
  final String? description;
  final int? price;
  final int? rentalPrice;
  final int? categoryId;
  final String? features;
  final int? isDamaged;
  final ProductImagesModel? productImages;

  factory ProductAddModel.fromJson(String str) =>
      ProductAddModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductAddModel.fromMap(Map<String, dynamic> json) => ProductAddModel(
        name: json["name"],
        description: json["description"],
        price: json["price"],
        rentalPrice: json["rental_price"],
        categoryId: json["category_id"],
        features: json["features"],
        isDamaged: json["is_damaged"],
        productImages: ProductImagesModel.fromMap(json["product_images"]),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "description": description,
        "price": price,
        "rental_price": rentalPrice,
        "category_id": categoryId,
        "features": features,
        "is_damaged": isDamaged,
      };
}

class ProductImagesModel {
  ProductImagesModel({
    required this.images,
  });

  final List<String> images;

  factory ProductImagesModel.fromJson(String str) =>
      ProductImagesModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductImagesModel.fromMap(Map<String, dynamic> json) =>
      ProductImagesModel(
        images: List<String>.from(json["images"].map((x) => x) ?? []),
      );

  Map<String, dynamic> toMap() => {
        "images": List<dynamic>.from(images.map((x) => x)),
      };
}
