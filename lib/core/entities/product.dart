// import '../_core_exports.dart';

// class Products {
//   Products({
//     required this.id,
//     required this.productName,
//     required this.price,
//     required this.rentalPrice,
//     required this.productImages,
//     required this.categoryName,
//     required this.userUsername,
//   });

//   final int id;
//   final String productName;
//   final int price;
//   final int rentalPrice;

//   final String categoryName;
//   final String userUsername;
//   final ProductImages productImages;

//   factory Products.fromJson(String str) => Products.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Products.fromMap(Map<String, dynamic> json) => Products(
//         id: json["id"],
//         productName: json["product_name"],
//         price: json["price"],
//         rentalPrice: json["rental_price"],
//         categoryName: json["category_name"],
//         userUsername: json["user_username"],
//         productImages: ProductImages.fromMap(json["product_images"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "id": id,
//         "product_name": productName,
//         "price": price,
//         "rental_price": rentalPrice,
//         "category_name": categoryName,
//         "user_username": userUsername,
//         "product_images": productImages.toMap(),
//       };
// }

// class ProductImages {
//   ProductImages({
//     required this.images,
//   });

//   final List<String> images;

//   factory ProductImages.fromJson(String str) =>
//       ProductImages.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory ProductImages.fromMap(Map<String, dynamic> json) => ProductImages(
//         images: List<String>.from(json["images"].map((x) => x)),
//       );

//   Map<String, dynamic> toMap() => {
//         "images": List<dynamic>.from(images.map((x) => x)),
//       };
// }
