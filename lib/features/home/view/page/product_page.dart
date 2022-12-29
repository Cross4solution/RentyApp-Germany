import 'package:rent_app_germany/core/_core_exports.dart';
import 'package:rent_app_germany/core/shared_widgets/app_button.dart';
import 'package:rent_app_germany/features/home/controller/home_controller.dart';
import 'package:rent_app_germany/features/home/view/widget/text_button_widget.dart';
import 'package:rent_app_germany/features/profile/controller/profile_controller.dart';
import '../../../../core/entities/get_product_model.dart';
import '../../../add_product/controller/product_controller.dart';
import '../widget/adress_list_widget.dart';
import '../widget/card_list_widget.dart';
import '../widget/price_information_card.dart';
import '../widget/product_seller_person_widget.dart';
import '../widget/product_slidable_images.dart';

class ProductPage extends StatefulWidget {
  final ProductFeatures productFeatures;
  const ProductPage({Key? key, required this.productFeatures})
      : super(key: key);

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
          physics: const BouncingScrollPhysics(),
          child: Consumer(
            builder: (context, HomeController homeController, child) {
              return Column(
                children: [
                  Stack(
                    children: [
                      ProductSlidableImages(
                          productFeatures: widget.productFeatures),
                      Positioned(
                        left: 12,
                        top: 12,
                        child: GestureDetector(
                          onTap: () => Go.to.back(),
                          child: const CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Center(
                              child: Icon(
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
                            Text(
                              widget.productFeatures.productName!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 22),
                            ),
                            const Icon(Icons.favorite_border_rounded)
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ProductSellerPerson(
                            productFeatures: widget.productFeatures),
                        PriceInformationCard(
                            productFeatures: widget.productFeatures),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Ürün Özellikleri',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 22),
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        const Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                        Text(widget.productFeatures.productFeatures
                            .toString()),
                        const SizedBox(
                          height: 24,
                        ),
                        AppButton.outline(
                            onTap: () {
                              Go.to.page(PageRoutes.productRentPage, arguments: widget.productFeatures);
                            },
                            buttonText: 'Kirala')
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
