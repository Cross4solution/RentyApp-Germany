import 'package:rent_app_germany/core/_core_exports.dart';
import 'package:rent_app_germany/features/home/controller/home_controller.dart';
import 'package:rent_app_germany/features/home/view/widget/text_button_widget.dart';
import '../widget/product_seller_person_widget.dart';
import '../widget/select_price_card.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Consumer(
          builder: (context, HomeController homeController, child) {
            return Column(
              children: [
                Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          'https://listelist.com/wp-content/uploads/2020/06/ambroise-nicolao-zK9O6EzP1Lw-unsplash-scaled.jpg',
                    ),
                    Positioned(
                      left: 12,
                      top: 12,
                      child: GestureDetector(
                        onTap: () => Go.to.back(),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Profesyonel Paten',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 22),
                          ),
                          TextButtonWidget(
                              onTap: () {},
                              text: 'Mesaj Gönder',
                              textColor: Colors.white,
                              color: Colors.red)
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const ProductSellerPerson(),
                      SelectPriceCard(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButtonWidget(
                              onTap: (() {
                                homeController.datePickerBeginSettings(context);
                              }),
                              icon: Icons.calendar_month_rounded,
                              text: homeController.formattingBeginDate,
                              textColor: Colors.black,
                              color: const Color.fromARGB(255, 142, 223, 144)),
                          TextButtonWidget(
                              onTap: (() {
                                homeController.datePickerEndSettings(context);
                              }),
                              icon: Icons.calendar_month_rounded,
                              text: homeController.formattingEndDate,
                              textColor: Colors.black,
                              color: const Color.fromARGB(255, 142, 223, 144)),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      if (homeController.rangeTime != null) ...[
                        Text(
                          '${homeController.rangeTime}' +
                              ' x 5\$ = ' +
                              '${homeController.rangeTime! * 5}' +
                              '\$',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        )
                      ],
                      const SizedBox(
                        height: 12,
                      ),
                      TextButtonWidget(
                          onTap: () {},
                          icon: Icons.send,
                          iconColor: Colors.white,
                          text: 'Kiralama isteği gönder',
                          textColor: Colors.white,
                          color: Colors.black),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                          'Profesyonel patenin özelliklerinin bulunduğu kısım '),
                      Text(
                          'Profesyonel patenin özelliklerinin bulunduğu kısım '),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        'Ürün yorumlarını görüntüle',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: 36,
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
