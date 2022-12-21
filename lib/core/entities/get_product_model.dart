import 'dart:convert';

import 'package:image_picker/image_picker.dart';

class GetProductModel {
  GetProductModel({
    required this.products,
  });

  final Products products;

  factory GetProductModel.fromJson(String str) =>
      GetProductModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetProductModel.fromMap(Map<String, dynamic> json) => GetProductModel(
        products: Products.fromMap(json["products"]),
      );

  Map<String, dynamic> toMap() => {
        "products": products.toMap(),
      };
}

class Products {
  Products({
    required this.data,
  });

  final List<ProductFeatures> data;

  factory Products.fromJson(String str) => Products.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Products.fromMap(Map<String, dynamic> json) => Products(
        data: List<ProductFeatures>.from(
            json["data"].map((x) => ProductFeatures.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class ProductFeatures {
  ProductFeatures({
    this.id,
     this.productName,
     this.productDescription,
     this.productFeatures,
     this.price,
     this.rentalPrice,
     this.productImages,
  
     this.categoryId,
     this.userUsername,
  });

  final int? id;
  final String? productName;
  final String? productDescription;
  final String? productFeatures;
  final int? price;
  final int? rentalPrice;
  final ProductImages? productImages;
  final String? categoryId;
  final String? userUsername;

  factory ProductFeatures.fromJson(String str) =>
      ProductFeatures.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductFeatures.fromMap(Map<String, dynamic> json) => ProductFeatures(
        id: json["id"],
        productName: json["product_name"],
        price: json["price"],
        rentalPrice: json["rental_price"],
        productFeatures: json["productFeatures"],
        productDescription: json["productDescription"],
        productImages: ProductImages.fromMap(json["product_images"]),
        categoryId: json["category_name"],
        userUsername: json["user_username"],
      );

  Map<String, dynamic> toMap() => {
        "name": productName,
        "description": productDescription,
        "price": price,
        "rental_price": rentalPrice,
        "category_id": categoryId,
        "features": productFeatures,
        // "images": productImages!.toMap(),
      };
}

class ProductImages {
  ProductImages({
    required this.images,
  });

  final List<String> images;

  factory ProductImages.fromJson(String str) =>
      ProductImages.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductImages.fromMap(Map<String, dynamic> json) => ProductImages(
        images: List<String>.from(json["images"].map((x) => x) ?? []),
      );

  Map<String, dynamic> toMap() => {
        "images": List<dynamic>.from(images.map((x) => x)),
      };
}
