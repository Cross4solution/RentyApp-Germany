import 'package:rent_app_germany/core/constants/product_list.dart';
import 'package:rent_app_germany/features/home/view/page/home_page.dart';

import '../../../../core/_core_exports.dart';

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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        height: 210,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: ProductList().productList.length,
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
                width: 125,
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
                            width: 110,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: ProductList().productList[index].imageURL,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  ProductList().productList[index].isTab = true;
                                  print(ProductList().productList[index].isTab);
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.all(6.0),
                                alignment: Alignment.center,
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    color: ProductList().productList[index].isTab! ? Colors.red : Colors.white,
                                    shape: BoxShape.circle),
                                child: Icon(Icons.heart_broken,
                                    size: 18,
                                    color: ProductList().productList[index].isTab! ? Colors.white : Colors.red),
                              ),
                            ),
                          ),
                        ],
                      ),
                       Text(
                        ProductList().productList[index].name,
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'Açıklama',
                        style: TextStyle(
                            color: Colors.grey.shade700, fontSize: 12),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(ProductList().productList[index].price),
                          Container(
                            alignment: Alignment.center,
                            height: 22,
                            width: 22,
                            decoration: const BoxDecoration(
                                color: Colors.black, shape: BoxShape.circle),
                            child: const Icon(Icons.add,
                                size: 18, color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
