import 'dart:convert';

class SellerOrdersModel {
  SellerOrdersModel({
    this.status,
    required this.orders,
  });

  final bool? status;
  final SellerOrders orders;

  factory SellerOrdersModel.fromJson(String str) =>
      SellerOrdersModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SellerOrdersModel.fromMap(Map<String, dynamic> json) =>
      SellerOrdersModel(
        status: json["status"],
        orders: SellerOrders.fromMap(json["orders"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "orders": orders.toMap(),
      };
}

class SellerOrders {
  SellerOrders({
    this.pageDetalis,
    required this.orders,
  });

  final SellerPageDetalis? pageDetalis;
  final List<OrderSellerDetails> orders;

  factory SellerOrders.fromJson(String str) => SellerOrders.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SellerOrders.fromMap(Map<String, dynamic> json) => SellerOrders(
        pageDetalis: SellerPageDetalis.fromMap(json["page_detalis"]),
        orders: List<OrderSellerDetails>.from(json["orders"].map((x) => OrderSellerDetails.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "page_detalis": pageDetalis!.toMap(),
        "orders": List<dynamic>.from(orders.map((x) => x.toMap())),
      };
}

class OrderSellerDetails {
  OrderSellerDetails({
    required this.id,
    required this.orderId,
    required this.userId,
    required this.sellerId,
    required this.userAddress,
    required this.totalPrice,
    required this.orderNote,
    required this.orderType,
    required this.orderStatus,
    required this.isSellerPaymnet,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String orderId;
  final int userId;
  final int sellerId;
  final String userAddress;
  final int totalPrice;
  final dynamic orderNote;
  final String orderType;
  final int orderStatus;
  final int isSellerPaymnet;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory OrderSellerDetails.fromJson(String str) => OrderSellerDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderSellerDetails.fromMap(Map<String, dynamic> json) => OrderSellerDetails(
        id: json["id"],
        orderId: json["order_id"],
        userId: json["user_id"],
        sellerId: json["seller_id"],
        userAddress: json["user_address"],
        totalPrice: json["total_price"],
        orderNote: json["order_note"],
        orderType: json["order_type"],
        orderStatus: json["order_status"],
        isSellerPaymnet: json["is_seller_paymnet"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "order_id": orderId,
        "user_id": userId,
        "seller_id": sellerId,
        "user_address": userAddress,
        "total_price": totalPrice,
        "order_note": orderNote,
        "order_type": orderType,
        "order_status": orderStatus,
        "is_seller_paymnet": isSellerPaymnet,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class SellerPageDetalis {
  SellerPageDetalis({
    this.currentPage,
  });

  final int? currentPage;

  factory SellerPageDetalis.fromJson(String str) =>
      SellerPageDetalis.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SellerPageDetalis.fromMap(Map<String, dynamic> json) => SellerPageDetalis(
        currentPage: json["current_page"],
      );

  Map<String, dynamic> toMap() => {
        "current_page": currentPage,
      };
}
