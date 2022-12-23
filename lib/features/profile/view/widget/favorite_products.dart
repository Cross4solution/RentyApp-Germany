import 'package:rent_app_germany/features/add_product/controller/product_controller.dart';
import 'package:rent_app_germany/features/profile/controller/profile_controller.dart';

import '../../../../core/_core_exports.dart';

class FavoriteProducts extends StatefulWidget {
  const FavoriteProducts({Key? key}) : super(key: key);

  @override
  State<FavoriteProducts> createState() => _FavoriteProductsState();
}

class _FavoriteProductsState extends State<FavoriteProducts> {
  @override
  void initState() {
      //  sl<ProfileController>().getFavorites();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      sl<ProfileController>().getFavorites();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Consumer(
        builder: (context, ProfileController profileController, child) {
          return profileController.favoriteList.isEmpty
              ? Column(
                  children: [
                    SvgPicture.asset(
                      AssetsPath().emptyFavoriteSVG,
                      height: 200,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      'Beğendiğiniz bir ürün bulunmamaktadır',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              : SizedBox(
                  height: 210,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: profileController.favoriteList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Go.to.page(PageRoutes.productPage,
                              arguments: profileController.favoriteList[index]);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 8,
                          ),
                          height: 150,
                          width: 175,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                                color: Colors.grey.shade300, width: 2),
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
                                        // child: CachedNetworkImage( //TODO: shared widgetsa taşınacak
                                        //   imageUrl: productController
                                        //       .favoriteList[index].imageURL,
                                        //   fit: BoxFit.cover,
                                        // ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      child: InkWell(
                                        onTap: () {
                                          profileController.removeFavoriteId =
                                              profileController
                                                  .favoriteList[index].id!;

                                          profileController
                                              .removeFavorites(index);
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.all(6.0),
                                          alignment: Alignment.center,
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.circle),
                                          child: Icon(Icons.cancel,
                                              size: 25, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  profileController
                                      .favoriteList[index].product!.name,
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
                                    child: Text(profileController
                                        .favoriteList[index]
                                        .product!
                                        .rentalPrice
                                        .toString()))
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
        },
      ),
    );
  }
}
