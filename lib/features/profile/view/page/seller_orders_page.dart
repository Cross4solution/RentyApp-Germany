import 'package:rent_app_germany/core/shared_widgets/app_button.dart';
import 'package:rent_app_germany/features/profile/controller/order_controller.dart';

import '../../../../core/_core_exports.dart';

class SellerOrdersPage extends StatefulWidget {
  const SellerOrdersPage({super.key});

  @override
  State<SellerOrdersPage> createState() => _SellerOrdersPageState();
}

class _SellerOrdersPageState extends State<SellerOrdersPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      sl<OrderController>().getSellerOrders();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text("Alıcı İstekleri"),
        centerTitle: true,
      ),
      body: Consumer(
        builder: (context, OrderController orderController, child) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: orderController.sellerOrderList.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(left: 8, right: 8, top: 8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade300)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Sipariş No: ",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            orderController.sellerOrderList[index].orderId,
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
                            "Sipariş Türü: ",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            orderController.sellerOrderList[index].orderType,
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
                            "Toplam Tutar: ",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "\$${orderController.sellerOrderList[index].totalPrice}",
                            style: const TextStyle(
                                fontSize: 17, color: Color(0xFF686868)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              orderController.updateSellerOrderId =
                                  orderController
                                      .sellerOrderList[index].orderId;

                              orderController.isOrder = -1;

                              orderController.updateSellerOrdes();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.red),
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  "Reddet",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              orderController.updateSellerOrderId =
                                  orderController
                                      .sellerOrderList[index].orderId;

                              orderController.isOrder = 1;

                              orderController.updateSellerOrdes();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.green),
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  "Kabul Et",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
