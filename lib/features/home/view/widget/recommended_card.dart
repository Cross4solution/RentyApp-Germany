import 'package:rent_app_germany/core/constants/product_list.dart';
import 'package:rent_app_germany/features/add_product/controller/product_controller.dart';
import 'package:rent_app_germany/features/home/view/page/home_page.dart';

import '../../../../core/_core_exports.dart';
import '../../controller/home_controller.dart';

class RecommendedCard extends StatefulWidget {
  const RecommendedCard({
    Key? key,
  }) : super(key: key);

  @override
  State<RecommendedCard> createState() => _RecommendedCardState();
}

class _RecommendedCardState extends State<RecommendedCard> {
  bool isTab = false;

 

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      sl<HomeController>().fetchProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        height: 210,
        child: Consumer(
          builder: (context, HomeController homeController, child) {
            return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: homeController.productFeatures.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Go.to.page(PageRoutes.productPage);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
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
                              SizedBox(
                                height: 120,
                                width: 175,
                                child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
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
                                    sl<ProductController>().addFavorite(index);

                                    setState(() {
                                      //  ProductList().productList[index].isFavorite =
                                      //   !ProductList().productList[index].isFavorite;
                                      // print(
                                      //     ProductList().productList[index].isFavorite);
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(6.0),
                                    alignment: Alignment.center,
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                        color: ProductList()
                                                .productList[index]
                                                .isFavorite
                                            ? Colors.red
                                            : Colors.white,
                                        shape: BoxShape.circle),
                                    child: Icon(Icons.favorite,
                                        size: 18,
                                        color: ProductList()
                                                .productList[index]
                                                .isFavorite
                                            ? Colors.white
                                            : Colors.red),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            homeController.productFeatures[index].productName,
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
                              child: Text(
                                  '\$${homeController.productFeatures[index].rentalPrice}.00'))
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
