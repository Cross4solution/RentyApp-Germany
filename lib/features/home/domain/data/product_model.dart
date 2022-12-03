class ProductModel {
  final String name;
  final String imageURL;
  bool? isTab;
  final String price;

  ProductModel({
    required this.name,
    required this.imageURL,
    this.isTab,
    required this.price,
  });
}
