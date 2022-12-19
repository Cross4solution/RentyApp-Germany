import 'package:rent_app_germany/core/constants/product_list.dart';
import 'package:rent_app_germany/features/add_product/controller/product_controller.dart';
import 'package:rent_app_germany/features/home/view/page/home_page.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/_core_exports.dart';
import '../../controller/home_controller.dart';

class AllProductsCard extends StatefulWidget {
  const AllProductsCard({super.key});

  @override
  State<AllProductsCard> createState() => _AllProductsCardState();
}

class _AllProductsCardState extends State<AllProductsCard> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      sl<HomeController>().fecthNextProductsPage();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isTab = false;
    return Consumer(
      builder: (context, HomeController homeController, child) {
        return homeController.productFeatures.isEmpty
            ? ShimmerWidget(widget: widget)
            : RefreshIndicator(
                onRefresh: () {
                  return homeController.refreshProductsPage();
                },
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.8),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: homeController.productFeatures.length,
                  controller: homeController.scroolController,
                  itemBuilder: (context, index) {
                    if (homeController.productFeatures.length - 1 == index) {
                      homeController.fecthNextProductsPage();
                    }

                    return GestureDetector(
                      onTap: () {
                        Go.to.page(PageRoutes.productPage);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        height: 150,
                        width: 175,
                        decoration: BoxDecoration(
                          color: ColorHelper.whiteColor,
                          borderRadius: BorderRadius.circular(24),
                          border:
                              Border.all(color: Colors.grey.shade300, width: 2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  SizedBox(
                                    height: 120,
                                    width: 175,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(16),
                                        topRight: Radius.circular(16),
                                      ),
                                      // child: Image.network(

                                      //   homeController.productFeatures[index].productImages.images[0])
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    child: InkWell(
                                      onTap: () {
                                        sl<ProductController>()
                                            .addFavorite(index);

                                        // setState(() {
                                        //   //  ProductList().productList[index].isFavorite =
                                        //   //   !ProductList().productList[index].isFavorite;
                                        //   // print(
                                        //   //     ProductList().productList[index].isFavorite);
                                        // });
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.all(6.0),
                                        alignment: Alignment.center,
                                        height: 27,
                                        width: 27,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade300),
                                            color: isTab
                                                ? Colors.red.shade400
                                                : Colors.white,
                                            shape: BoxShape.circle),
                                        child: Icon(Icons.favorite,
                                            size: 18,
                                            color: isTab
                                                ? Colors.white
                                                : Colors.red),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                homeController.productFeatures[index]
                                            .productName.length >
                                        16
                                    ? '${homeController.productFeatures[index].productName.substring(0, 16)}...'
                                    : homeController
                                        .productFeatures[index].productName,
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
                                        color: Colors.grey.shade700,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                      '\$${homeController.productFeatures[index].rentalPrice}.00'))
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
      },
    );
  }
}

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final AllProductsCard widget;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black.withOpacity(.1),
      highlightColor: Colors.black.withOpacity(.5),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.8),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: 8,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 175,
                  decoration: const BoxDecoration(
                    color: ColorHelper.whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 15,
                  width: 145,
                  decoration: const BoxDecoration(
                    color: ColorHelper.whiteColor,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 15,
                  width: 115,
                  decoration: const BoxDecoration(
                    color: ColorHelper.whiteColor,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),Container(
                  height: 15,
                  width: 115,
                  decoration: const BoxDecoration(
                    color: ColorHelper.whiteColor,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 25,
                  width: 100,
                  decoration: const BoxDecoration(
                    color: ColorHelper.whiteColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
