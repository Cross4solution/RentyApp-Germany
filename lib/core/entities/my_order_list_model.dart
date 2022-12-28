// To parse this JSON data, do
//
//     final myOrderModel = myOrderModelFromMap(jsonString);

import 'dart:convert';

class MyOrderModel {
    MyOrderModel({
        this.status,
        this.orders,
    });

    final bool? status;
    final Orders? orders;

    factory MyOrderModel.fromJson(String str) => MyOrderModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MyOrderModel.fromMap(Map<String, dynamic> json) => MyOrderModel(
        status: json["status"],
        orders: Orders.fromMap(json["orders"]),
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "orders": orders!.toMap(),
    };
}

class Orders {
    Orders({
        this.pageDetalis,
        this.orderDetails,
    });

    final PageDetalis? pageDetalis;
    final List<OrderDetails>? orderDetails;

    factory Orders.fromJson(String str) => Orders.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Orders.fromMap(Map<String, dynamic> json) => Orders(
        pageDetalis: PageDetalis.fromMap(json["page_detalis"]),
        orderDetails: List<OrderDetails>.from(json["orders"].map((x) => OrderDetails.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "page_detalis": pageDetalis!.toMap(),
        "orders": List<dynamic>.from(orderDetails!.map((x) => x.toMap())),
    };
}

class OrderDetails {
    OrderDetails({
       required this.orderId,
       required this.orderStatus,
       required this.totalPrice,
       required this.orderType,
       required this.createdAt,
    });

    final String orderId;
    final int orderStatus;
    final int totalPrice;
    final String orderType;
    final DateTime createdAt;

    factory OrderDetails.fromJson(String str) => OrderDetails.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory OrderDetails.fromMap(Map<String, dynamic> json) => OrderDetails(
        orderId: json["order_id"],
        orderStatus: json["order_status"],
        totalPrice: json["total_price"],
        orderType: json["order_type"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toMap() => {
        "order_id": orderId,
        "order_status": orderStatus,
        "total_price": totalPrice,
        "order_type": orderType,
        "created_at": createdAt.toIso8601String(),
    };
}

class PageDetalis {
    PageDetalis({
        this.currentPage,
    });

    final int? currentPage;

    factory PageDetalis.fromJson(String str) => PageDetalis.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PageDetalis.fromMap(Map<String, dynamic> json) => PageDetalis(
        currentPage: json["current_page"],
    );

    Map<String, dynamic> toMap() => {
        "current_page": currentPage,
    };
}
