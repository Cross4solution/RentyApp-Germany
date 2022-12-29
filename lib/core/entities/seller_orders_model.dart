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

  factory SellerOrders.fromJson(String str) =>
      SellerOrders.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SellerOrders.fromMap(Map<String, dynamic> json) => SellerOrders(
        pageDetalis: SellerPageDetalis.fromMap(json["page_detalis"]),
        orders: List<OrderSellerDetails>.from(
            json["orders"].map((x) => OrderSellerDetails.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "page_detalis": pageDetalis!.toMap(),
        "orders": List<dynamic>.from(orders.map((x) => x.toMap())),
      };
}

class OrderSellerDetails {
  OrderSellerDetails({
    required this.orderId,
    required this.totalPrice,
    required this.orderType,
    required this.orderStatus,
    required this.createdAt,
  });

  final String orderId;

  final int totalPrice;

  final String orderType;
  final int orderStatus;

  final DateTime createdAt;

  factory OrderSellerDetails.fromJson(String str) =>
      OrderSellerDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderSellerDetails.fromMap(Map<String, dynamic> json) =>
      OrderSellerDetails(
        orderId: json["order_id"],
        totalPrice: json["total_price"],
        orderType: json["order_type"],
        orderStatus: json["order_status"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toMap() => {
        "order_id": orderId,
        "total_price": totalPrice,
        "order_type": orderType,
        "order_status": orderStatus,
        "created_at": createdAt.toIso8601String(),
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

  factory SellerPageDetalis.fromMap(Map<String, dynamic> json) =>
      SellerPageDetalis(
        currentPage: json["current_page"],
      );

  Map<String, dynamic> toMap() => {
        "current_page": currentPage,
      };
}
