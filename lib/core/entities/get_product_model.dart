import 'dart:convert';

class GetProductModel {
  GetProductModel({
    required this.products,
  });

  final Products products;

  factory GetProductModel.fromJson(dynamic str) =>
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
    this.price,
    this.slug,
    this.rentalPrice,
    this.productImages,
    this.isDamaged,
    this.categoryName,
    this.userUsername,
    this.rating,
    this.ratingCount,
    this.favorites,
  });

  final int? id;
  final String? productName;
  final String? price;
  final String? slug;
  final String? rentalPrice;
  final ProductImages? productImages;
  final String? isDamaged;
  final String? categoryName;
  final String? userUsername;
  final dynamic rating;
  final String? ratingCount;
  final List<dynamic>? favorites;

  factory ProductFeatures.fromJson(String str) =>
      ProductFeatures.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductFeatures.fromMap(Map<String, dynamic> json) => ProductFeatures(
        id: json["id"],
        productName: json["product_name"],
        price: json["price"],
        slug: json["slug"],
        rentalPrice: json["rental_price"],
        productImages: ProductImages.fromMap(json["product_images"]),
        isDamaged: json["is_damaged"],
        categoryName: json["category_name"],
        userUsername: json["user_username"],
        rating: json["rating"],
        ratingCount: json["rating_count"],
        favorites: json["favorites"] == null
            ? []
            : List<dynamic>.from(json["favorites"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "product_name": productName,
        "price": price,
        "slug": slug,
        "rental_price": rentalPrice,
        "product_images": productImages!.toMap(),
        "is_damaged": isDamaged,
        "category_name": categoryName,
        "user_username": userUsername,
        "rating": rating,
        "rating_count": ratingCount,
        "favorites": favorites == null
            ? []
            : List<dynamic>.from(favorites!.map((x) => x)),
      };
}

class ProductImages {
  ProductImages({
    this.images,
  });

  final List<String?>? images;

  factory ProductImages.fromJson(String str) =>
      ProductImages.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductImages.fromMap(Map<String, dynamic> json) => ProductImages(
        images: json["images"] == null
            ? []
            : List<String?>.from(json["images"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
      };
}
