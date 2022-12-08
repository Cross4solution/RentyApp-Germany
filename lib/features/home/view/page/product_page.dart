import 'package:rent_app_germany/core/_core_exports.dart';
import 'package:rent_app_germany/features/home/controller/home_controller.dart';
import 'package:rent_app_germany/features/home/view/widget/text_button_widget.dart';
import '../widget/price_information_card.dart';
import '../widget/product_seller_person_widget.dart';
import '../widget/select_price_card.dart';
import '../widget/slidable_trends_card.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer(
            builder: (context, HomeController homeController, child) {
              return Column(
                children: [
                  Stack(
                    children: [
                      const SlidableTrendsCard(),
                      Positioned(
                        left: 12,
                        top: 12,
                        child: GestureDetector(
                          onTap: () => Go.to.back(),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Center(
                              child: const Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.grey,
                              ),
                            ),
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
      
                            Icon(Icons.favorite_border_rounded)
                            // TextButtonWidget(
                            //     onTap: () {},
                            //     text: 'Mesaj Gönder',
                            //     textColor: Colors.white,
                            //     color: Colors.red)
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const ProductSellerPerson(),
                        // SelectPriceCard(),
      
                        const PriceInformationCard(),
      
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButtonWidget(
                                onTap: (() {
                                  homeController.datePickerBeginSettings(context);
                                }),
                                iconLeft: Icons.calendar_month_rounded,
                                text: homeController.formattingBeginDate,
                                textColor: Colors.black,
                                color: const Color.fromARGB(255, 142, 223, 144)),
                            TextButtonWidget(
                                onTap: (() {
                                  homeController.datePickerEndSettings(context);
                                }),
                                iconLeft: Icons.calendar_month_rounded,
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
                            'Toplam (${homeController.rangeTime}) gün : '
                            '\$'
                            '${homeController.rangeTime! * 5}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          )
                        ],
                        const SizedBox(
                          height: 12,
                        ),
                        TextButtonWidget(
                            onTap: () {},
                            iconRight: Icons.send,
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
      ),
    );
  }
}
