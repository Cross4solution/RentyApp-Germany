import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rent_app_germany/features/home/controller/home_controller.dart';

import '../../../../core/_core_exports.dart';
import '../page/home_page.dart';

class CategoryCard extends StatefulWidget {
  const CategoryCard({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      sl<HomeController>().fetchProductTopCategory();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Consumer(
        builder: (context, HomeController homeController, child) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: homeController.productCategories.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    height: 85,
                    width: 85,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: CachedNetworkImage(
                        imageUrl: imageList[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    homeController.productCategories[index].name,
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}
