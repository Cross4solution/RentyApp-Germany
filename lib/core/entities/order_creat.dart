import 'dart:convert';

class OrderModel {
  OrderModel({
    this.productId,
    this.startDate,
    this.endDate,
    this.adressId,
    this.cardId,
  });

  final int? productId;
  final String? startDate;
  final String? endDate;
  final String? adressId;
  final String? cardId;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "product_id": productId,
        "start_date": startDate,
        "end_date": endDate,
        "address_id": adressId,
        "card_id": cardId,
      };
}
