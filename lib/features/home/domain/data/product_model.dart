class ProductModel {
  final String name;
  final String imageURL;
  bool isFavorite;
  final String price;

  ProductModel({
    required this.name,
    required this.imageURL,
    this.isFavorite = false,
    required this.price,
  });
}
