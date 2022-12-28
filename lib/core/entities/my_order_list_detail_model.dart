import 'dart:convert';

class MyOrderDetailsModel {
  MyOrderDetailsModel({
    this.status,
    this.order,
  });

  final bool? status;
  final OrderModelDetails? order;

  factory MyOrderDetailsModel.fromJson(String str) =>
      MyOrderDetailsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MyOrderDetailsModel.fromMap(Map<String, dynamic> json) =>
      MyOrderDetailsModel(
        status: json["status"],
        order: OrderModelDetails.fromMap(json["order"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "order": order!.toMap(),
      };
}

class OrderModelDetails {
  OrderModelDetails({
    required this.orderDetalis,
    required this.userLocation,
    required this.paymentDetalis,
    required this.productDetail,
  });

  final OrderDetalis orderDetalis;
  final OrdersUserLocation userLocation;
  final PaymentDetalis paymentDetalis;
  final ProductDetail productDetail;

  factory OrderModelDetails.fromJson(String str) => OrderModelDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderModelDetails.fromMap(Map<String, dynamic> json) => OrderModelDetails(
        orderDetalis: OrderDetalis.fromMap(json["order_detalis"]),
        userLocation: OrdersUserLocation.fromMap(json["user_location"]),
        paymentDetalis: PaymentDetalis.fromMap(json["payment_detalis"]),
        productDetail: ProductDetail.fromMap(json["product_detail"]),
      );

  Map<String, dynamic> toMap() => {
        "order_detalis": orderDetalis.toMap(),
        "user_location": userLocation.toMap(),
        "payment_detalis": paymentDetalis.toMap(),
        "product_detail": productDetail.toMap(),
      };
}

class OrderDetalis {
  OrderDetalis({
    required this.orderId,
    required this.orderStatus,
    required this.orderTotal,
    required this.sellerName,
    required this.sellerUsername,
    required this.orderNote,
    required this.orderDate,
    required this.orderEndRefund,
    required this.rentStartDate,
    required this.rentEndDate,
    required this.orderType,
  });

  final String orderId;
  final int orderStatus;
  final int orderTotal;
  final String sellerName;
  final String sellerUsername;
  final dynamic orderNote;
  final DateTime orderDate;
  final int orderEndRefund;
  final DateTime rentStartDate;
  final DateTime rentEndDate;
  final String orderType;

  factory OrderDetalis.fromJson(String str) =>
      OrderDetalis.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderDetalis.fromMap(Map<String, dynamic> json) => OrderDetalis(
        orderId: json["order_id"],
        orderStatus: json["order_status"],
        orderTotal: json["order_total"],
        sellerName: json["seller_name"],
        sellerUsername: json["seller_username"],
        orderNote: json["order_note"],
        orderDate: DateTime.parse(json["order_date"]),
        orderEndRefund: json["order_end_refund"],
        rentStartDate: DateTime.parse(json["rent_start_date"]),
        rentEndDate: DateTime.parse(json["rent_end_date"]),
        orderType: json["order_type"],
      );

  Map<String, dynamic> toMap() => {
        "order_id": orderId,
        "order_status": orderStatus,
        "order_total": orderTotal,
        "seller_name": sellerName,
        "seller_username": sellerUsername,
        "order_note": orderNote,
        "order_date": orderDate.toIso8601String(),
        "order_end_refund": orderEndRefund,
        "rent_start_date":
            "${rentStartDate.year.toString().padLeft(4, '0')}-${rentStartDate.month.toString().padLeft(2, '0')}-${rentStartDate.day.toString().padLeft(2, '0')}",
        "rent_end_date":
            "${rentEndDate.year.toString().padLeft(4, '0')}-${rentEndDate.month.toString().padLeft(2, '0')}-${rentEndDate.day.toString().padLeft(2, '0')}",
        "order_type": orderType,
      };
}

class PaymentDetalis {
  PaymentDetalis({
    required this.paymentAmount,
    required this.paymentCardLast4,
    required this.paymentDate,
  });

  final String paymentAmount;
  final String paymentCardLast4;
  final DateTime paymentDate;

  factory PaymentDetalis.fromJson(String str) =>
      PaymentDetalis.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PaymentDetalis.fromMap(Map<String, dynamic> json) => PaymentDetalis(
        paymentAmount: json["payment_amount"],
        paymentCardLast4: json["payment_card_last4"],
        paymentDate: DateTime.parse(json["payment_date"]),
      );

  Map<String, dynamic> toMap() => {
        "payment_amount": paymentAmount,
        "payment_card_last4": paymentCardLast4,
        "payment_date": paymentDate.toIso8601String(),
      };
}

class ProductDetail {
  ProductDetail({
    required this.productId,
    required this.productName,
    required this.productImages,
  });

  final int productId;
  final String productName;
  final String productImages;

  factory ProductDetail.fromJson(String str) =>
      ProductDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductDetail.fromMap(Map<String, dynamic> json) => ProductDetail(
        productId: json["product_id"],
        productName: json["product_name"],
        productImages: json["product_images"],
      );

  Map<String, dynamic> toMap() => {
        "product_id": productId,
        "product_name": productName,
        "product_images": productImages,
      };
}

class OrdersUserLocation {
  OrdersUserLocation({
    required this.fullAddress,
    required this.city,
    required this.postalCode,
  });

  final String fullAddress;
  final String city;
  final String postalCode;

  factory OrdersUserLocation.fromJson(String str) =>
      OrdersUserLocation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrdersUserLocation.fromMap(Map<String, dynamic> json) => OrdersUserLocation(
        fullAddress: json["full_address"],
        city: json["city"],
        postalCode: json["postal_code"],
      );

  Map<String, dynamic> toMap() => {
        "full_address": fullAddress,
        "city": city,
        "postal_code": postalCode,
      };
}
