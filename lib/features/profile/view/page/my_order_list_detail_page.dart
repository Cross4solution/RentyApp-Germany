import 'package:rent_app_germany/features/profile/controller/order_controller.dart';

import '../../../../core/_core_exports.dart';

class MyOrderListDetailPage extends StatefulWidget {
  const MyOrderListDetailPage({super.key});

  @override
  State<MyOrderListDetailPage> createState() => _MyOrderListDetailPageState();
}

class _MyOrderListDetailPageState extends State<MyOrderListDetailPage> {
  @override
  void initState() {
    sl<OrderController>().getOrdersDetails();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Sipariş Detayları'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Consumer(
          builder: (context, OrderController orderController, child) {
            return Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Sipariş No: ",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              orderController
                                  .myOrderDetails!.order!.orderDetalis.orderId,
                              style: const TextStyle(
                                  fontSize: 17, color: Color(0xFF686868)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Sipariş Tarihi: ",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              orderController
                                  .myOrderDetails!.order!.orderDetalis.orderDate
                                  .toString()
                                  .substring(0, 16),
                              style: const TextStyle(
                                  fontSize: 17, color: Color(0xFF686868)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ürün Detayları',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.orange.shade800),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Ürün Adı: ",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              orderController.myOrderDetails!.order!
                                  .productDetail.productName,
                              style: const TextStyle(
                                  fontSize: 18, color: Color(0xFF686868)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Sipariş Durumu: ",
                              style: TextStyle(fontSize: 18),
                            ),
                            if (orderController.myOrderDetails!.order!
                                    .orderDetalis.orderStatus ==
                                1) ...[
                              Text(
                                "Sipariş onaylandı",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.green.shade500),
                              ),
                            ],
                            if (orderController.myOrderDetails!.order!
                                    .orderDetalis.orderStatus ==
                                0) ...[
                              const Text(
                                "Onay bekliyor",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.orange),
                              ),
                            ],
                            if (orderController.myOrderDetails!.order!
                                    .orderDetalis.orderStatus ==
                                0) ...[
                              const Text("Satıcı tarafında reddedildi",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red,
                                  )),
                            ],
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Satıcı Adı: ",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              orderController.myOrderDetails!.order!
                                  .orderDetalis.sellerName,
                              style: const TextStyle(
                                  fontSize: 18, color: Color(0xFF686868)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Kiralama Detayları',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.orange.shade800),
                            ),
                            Text(
                              "${orderController.myOrderDetails!.order!.orderDetalis.rentEndDate.difference(orderController.myOrderDetails!.order!.orderDetalis.rentStartDate).inDays} gün",
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF686868)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "Kiralama Başlangıç Tarihi",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          orderController
                              .myOrderDetails!.order!.orderDetalis.rentStartDate
                              .toString()
                              .substring(0, 16),
                          style: const TextStyle(
                              fontSize: 18, color: Color(0xFF686868)),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "Kiralama Bitiş Tarihi",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          orderController
                              .myOrderDetails!.order!.orderDetalis.rentEndDate
                              .toString()
                              .substring(0, 16),
                          style: const TextStyle(
                              fontSize: 18, color: Color(0xFF686868)),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CachedNetworkImage(
                          imageUrl:
                              "https://api.testsoftware.site/${orderController.myOrderDetails!.order!.productDetail.productImages}"),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Teslimat Adresi',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.orange.shade800),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "username",
                          style:
                              TextStyle(fontSize: 18, color: Color(0xFF686868)),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          orderController
                              .myOrderDetails!.order!.userLocation.city,
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          orderController
                              .myOrderDetails!.order!.userLocation.fullAddress,
                          style: const TextStyle(
                              fontSize: 18, color: Color(0xFF686868)),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          orderController
                              .myOrderDetails!.order!.userLocation.postalCode,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Ödeme Bilgileri',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.orange.shade800),
                            ),
                            Text(
                              "**** ****${orderController.myOrderDetails!.order!.paymentDetalis.paymentCardLast4}",
                              style: const TextStyle(
                                  fontSize: 18, color: Color(0xFF686868)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Ödeme Tarihi: ",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              orderController.myOrderDetails!.order!
                                  .paymentDetalis.paymentDate
                                  .toString()
                                  .substring(0, 16),
                              style: const TextStyle(
                                  fontSize: 18, color: Color(0xFF686868)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Toplam Tutar: ",
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              "\$${orderController.myOrderDetails!.order!.paymentDetalis.paymentAmount}",
                              style: const TextStyle(
                                  fontSize: 18, color: Color(0xFF686868)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
