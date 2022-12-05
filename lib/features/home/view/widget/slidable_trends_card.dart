import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/_core_exports.dart';
import '../page/home_page.dart';

class SlidableTrendsCard extends StatefulWidget {
  const SlidableTrendsCard({
    Key? key,
  }) : super(key: key);

  @override
  State<SlidableTrendsCard> createState() => _SlidableTrendsCardState();
}

class _SlidableTrendsCardState extends State<SlidableTrendsCard> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: imageList.length,
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin: const EdgeInsets.all(6),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                // color: Colors.red,
                borderRadius: BorderRadius.circular(24),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: CachedNetworkImage(
                  imageUrl: imageList[index],
                  // fit: BoxFit.cover,
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 200,
            autoPlay: true,
            reverse: false,
            autoPlayInterval: const Duration(seconds: 8),
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
      count: imageList.length,
      effect: const ExpandingDotsEffect(
          dotWidth: 10, dotHeight: 10, activeDotColor: Colors.red),
    );
  }
}
