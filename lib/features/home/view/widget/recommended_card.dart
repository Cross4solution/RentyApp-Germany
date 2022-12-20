import 'package:rent_app_germany/features/profile/controller/profile_controller.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/_core_exports.dart';
import '../../../../core/entities/get_product_model.dart';
import '../../controller/home_controller.dart';

class RecommendedCard extends StatefulWidget {
  RecommendedCard({
    Key? key,
  }) : super(key: key);

  // final ProductFeatures  productFeatures;

  @override
  State<RecommendedCard> createState() => _RecommendedCardState();
}

class _RecommendedCardState extends State<RecommendedCard> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      sl<HomeController>().fecthNextProductsPage();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ProductFeatures productFeatures;
    return Consumer(
      builder: (context, HomeController homeController, child) {
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.8),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: homeController.productFeatures.length,
          controller: homeController.scroolController,
          itemBuilder: (context, index) {
            // if (homeController.productFeatures.length - 1 == index) {
            //   homeController.fecthNextProductsPage();
            // }

            final productFeatures = homeController.productFeatures[index];

            return GestureDetector(
              onTap: () {
                Go.to.page(PageRoutes.productPage, arguments: productFeatures);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                height: 150,
                width: 175,
                decoration: BoxDecoration(
                  color: ColorHelper.whiteColor,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.grey.shade300, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          const SizedBox(
                            height: 120,
                            width: 175,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                              //   child:productFeatures.productImages!.images[0] != null ?

                              //    Image.network(
                              //  "https://api.testsoftware.site/${productFeatures.productImages!.images[index][0]}"

                              //    ): SizedBox.shrink()
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: InkWell(
                              onTap: () {
                                sl<ProfileController>().addId = productFeatures.id!;
                                sl<ProfileController>()
                                    .addFavorites();
                              },
                              child: Container(
                                  margin: EdgeInsets.all(6.0),
                                  alignment: Alignment.center,
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle),
                                  child: Icon(Icons.favorite,
                                      size: 18, color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        productFeatures.productName!.length > 16
                            ? productFeatures.productName!.substring(0, 16) +
                                '...'
                            : productFeatures.productName!,
                        style: const TextStyle(fontSize: 15),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 18,
                          ),
                          Text(
                            'İstanbul / Kadıköy',
                            style: TextStyle(
                                color: Colors.grey.shade700, fontSize: 12),
                          ),
                        ],
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text('\$${productFeatures.rentalPrice}.00'))
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
