import 'dart:convert';

class FavoriteProductsModel {
    FavoriteProductsModel({
         this.favorites,
    });

    final List<Favorite>? favorites;

    factory FavoriteProductsModel.fromJson(String str) => FavoriteProductsModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory FavoriteProductsModel.fromMap(Map<String, dynamic> json) => FavoriteProductsModel(
        favorites: List<Favorite>.from(json["favorites"].map((x) => Favorite.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "favorites": List<dynamic>.from(favorites!.map((x) => x.toMap() )),
    };
}

class Favorite {
    Favorite({
         this.id,
         this.product,
    });

    final int? id;
    final Product? product;

    factory Favorite.fromJson(String str) => Favorite.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Favorite.fromMap(Map<String, dynamic> json) => Favorite(
        id: json["id"],
        product: Product.fromMap(json["product"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "product": product!.toMap(),
    };
}

class Product {
    Product({
        required this.id,
        required this.name,
        required this.price,
        required this.rentalPrice,
        required this.description,
        required this.productImages,
    });

    final int id;
    final String name;
    final int price;
    final int rentalPrice;
    final String description;
    final ProductImages productImages;

    factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        rentalPrice: json["rental_price"],
        description: json["description"],
        productImages: ProductImages.fromMap(json["product_images"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "price": price,
        "rental_price": rentalPrice,
        "description": description,
        "product_images": productImages.toMap(),
    };
}

class ProductImages {
    ProductImages({
        required this.images,
    });

    final List<String> images;

    factory ProductImages.fromJson(String str) => ProductImages.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProductImages.fromMap(Map<String, dynamic> json) => ProductImages(
        images: List<String>.from(json["images"].map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "images": List<dynamic>.from(images.map((x) => x)),
    };
}
