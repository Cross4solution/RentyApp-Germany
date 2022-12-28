import 'package:rent_app_germany/core/shared_widgets/app_button.dart';

import '../../../../core/_core_exports.dart';
import '../../controller/order_controller.dart';

class OrderListPage extends StatefulWidget {
  const OrderListPage({Key? key}) : super(key: key);

  @override
  State<OrderListPage> createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  @override
  void initState() {
    sl<OrderController>().getOrders();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Siparişlerim'),
        centerTitle: true,
      ),
      body: Consumer(
        builder: (context, OrderController orderController, child) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: orderController.orderList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  orderController.orderId =
                      orderController.orderList[index].orderId;

                  Go.to.page(PageRoutes.myOrderListDetailPage);
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 16, top: 16, right: 16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Colors.amber.shade300, width: 2),
                      color: Colors.amber.shade100,
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Oluşturulma Tarihi : ',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              orderController.orderList[index].createdAt
                                  .toString()
                                  .substring(0, 16),
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Toplam ücret : ',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "\$"
                              "${orderController.orderList[index].totalPrice}",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Sipariş tipi : ',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              orderController.orderList[index].orderType,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: const [
                            Text(
                              'Sipariş durumu : ',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Onay bekliyor',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
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
