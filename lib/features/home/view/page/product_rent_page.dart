import 'package:rent_app_germany/features/home/controller/home_controller.dart';

import '../../../../core/_core_exports.dart';
import '../../../../core/entities/get_product_model.dart';
import '../../../add_product/controller/product_controller.dart';
import '../widget/adress_list_widget.dart';
import '../widget/card_list_widget.dart';
import '../widget/text_button_widget.dart';

class ProductRentPage extends StatefulWidget {
  final ProductFeatures productFeatures;
  const ProductRentPage({Key? key, required this.productFeatures}) : super(key: key);

  @override
  State<ProductRentPage> createState() => _ProductRentPageState();
}

class _ProductRentPageState extends State<ProductRentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ürün Kirala'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Consumer(
          builder: (context, HomeController homeController, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                   const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Kiralamak istediğiniz tarih aralığını giriniz.',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade800),
                  ),
                   const SizedBox(
                    height: 12,
                  ),
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
                          color:  Colors.grey.shade300),
                      TextButtonWidget(
                          onTap: (() {
                            homeController.datePickerEndSettings(context);
                          }),
                          iconLeft: Icons.calendar_month_rounded,
                          text: homeController.formattingEndDate,
                          textColor: Colors.black,
                          color: Colors.grey.shade300),
                    ],
                  ),

                  const Divider(height: 50, indent: 50, endIndent: 50, ),
                  
                  if (homeController.rangeTime != null) ...[

                   
                    Text(
                      'Toplam (${homeController.rangeTime}) gün : '
                      '\$'
                      '${homeController.rangeTime! *int.parse(widget.productFeatures.rentalPrice!) }',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ), 
                     const Divider(height: 50, indent: 50, endIndent: 50, ),
                  ],
                  
                  Text(
                    'Teslimat adresi seçiniz. ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade800),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  AdressListWidget(),
                   const Divider(height: 50, indent: 50, endIndent: 50, ),
                  Text(
                    'Ödeme yapacağınız kartı seçiniz.',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade800),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CardListWidget(),
                  const SizedBox(
                    height: 36,
                  ),
                  TextButtonWidget(
                      height: 55,
                      onTap: () {
                        sl<ProductController>().orderCreat();
                      },
                      iconRight: Icons.send,
                      iconColor: Colors.white,
                      text: 'Kiralama isteği gönder',
                      textColor: Colors.white,
                      fontSize: 20,
                      color: Colors.green.shade800),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
