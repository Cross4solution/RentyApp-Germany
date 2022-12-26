import 'dart:convert';

class CreditCardsModel {
  CreditCardsModel({
    required this.data,
    this.status,
    this.errorCode,
  });

  final List<CreditCardDetails> data;
  final bool? status;
  final int? errorCode;

  factory CreditCardsModel.fromJson(String str) =>
      CreditCardsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreditCardsModel.fromMap(Map<String, dynamic> json) => CreditCardsModel(
        data: List<CreditCardDetails>.from(
            json["data"].map((x) => CreditCardDetails.fromMap(x))),
        status: json["status"],
        errorCode: json["error_code"],
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "status": status,
        "error_code": errorCode,
      };
}

class CreditCardDetails {
  CreditCardDetails({
    this.cardNumber,
    this.expMonth,
    this.expYear,
    this.cvc,
    this.id,
    this.cardName,
    this.cardBrand,
    this.cardLast4,
  });

  final int? id;
  final String? cardName;
  final String? cardBrand;
  final String? cardLast4;
  //---------------------
  final String? cardNumber;
  final String? expMonth;
  final String? expYear;
  final String? cvc;

  factory CreditCardDetails.fromJson(String str) =>
      CreditCardDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreditCardDetails.fromMap(Map<String, dynamic> json) =>
      CreditCardDetails(
        id: json["id"],
        cardName: json["card_name"],
        cardBrand: json["card_brand"],
        cardLast4: json["card_last4"],
      );

  Map<String, dynamic> toMap() => {
        "card_number": cardNumber,
        "exp_month": expMonth,
        "exp_year": expYear,
        "cvc": cvc,
        "card_name": cardName,
      };
}
