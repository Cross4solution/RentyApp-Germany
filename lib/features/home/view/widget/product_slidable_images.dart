import 'package:carousel_slider/carousel_slider.dart';
import 'package:rent_app_germany/core/shared_widgets/full_photo_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/_core_exports.dart';
import '../../../../core/entities/get_product_model.dart';
import '../page/home_page.dart';

class ProductSlidableImages extends StatefulWidget {
  final ProductFeatures productFeatures;
  const ProductSlidableImages({super.key, required this.productFeatures});

  @override
  State<ProductSlidableImages> createState() => _ProductSlidableImagesState();
}

class _ProductSlidableImagesState extends State<ProductSlidableImages> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.productFeatures.productImages!.images!.length,
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin: const EdgeInsets.all(4),
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                // color: Colors.red,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade300, width: 2)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: GestureDetector(
                  onTap: () {
                    Go.to.page(PageRoutes.fullPhotoWidget,
                        arguments: widget.productFeatures);
                  },
                  child: CachedNetworkImage(
                      imageUrl:
                          "https://api.testsoftware.site/${widget.productFeatures.productImages!.images![index]}",
                         

                      fit: BoxFit.cover,
                      ),
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 250,
            autoPlay: false,
            reverse: false,
            autoPlayInterval: const Duration(seconds: 4),
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        buildIndicator(),
        const SizedBox(
          height: 4,
        ),
      ],
    );
  }

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: widget.productFeatures.productImages!.images!.length,
      effect: const ExpandingDotsEffect(
          dotWidth: 10, dotHeight: 10, activeDotColor: Colors.red),
    );
  }
}
