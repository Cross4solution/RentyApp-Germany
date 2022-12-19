import 'package:carousel_slider/carousel_slider.dart';
import 'package:rent_app_germany/core/_core_exports.dart';
import 'package:rent_app_germany/features/home/controller/home_controller.dart';
import 'package:rent_app_germany/features/home/repo/impl/home_repo_impl.dart';
import 'package:rent_app_germany/features/home/view/widget/home_page_app_bar.dart';
import 'package:rent_app_germany/features/home/view/widget/recommended_card.dart';
import '../widget/category_card.dart';
import '../widget/slidable_trends_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const HomePageAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SlidableTrendsCard(),
            Divider(),
            Padding(
              padding: EdgeInsets.only(left: 10, bottom: 12),
              child: Text(
                'Kategoriler',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            CategoryCard(),
            Divider(),
            Padding(
              padding: EdgeInsets.only(left: 10, bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Sizin İçin Önerilenler',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: () {

                        Go.to.page(PageRoutes.allProductsPage);
                        
                      },
                      child: Text('Tümünü Gör',
                          style:
                              TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color: Colors.red)),
                    ),
                  ),
                ],
              ),
            ),
            RecommendedCard(),
            // RecommendedCard(),
            // RecommendedCard(),

        
          ],
        ),
      ),
    );
  }
}

List imageList = [
  'https://fdn2.gsmarena.com/vv/bigpic/vivo-iqoo11-pro-r.jpg',
  'https://fdn2.gsmarena.com/vv/bigpic/apple-watch-series-7-stainless-steel.jpg',
  'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-se-2020.jpg',
  'https://fdn2.gsmarena.com/vv/bigpic/apple-watch-8se-2022.jpg',
  'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-14-pro.jpg',
  'https://fdn2.gsmarena.com/vv/bigpic/xiaomi-redmi-note-12-pro-discovery-explorer.jpg',
  'https://fdn2.gsmarena.com/vv/bigpic/apple-watch-series-7-stainless-steel.jpg',
  'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-se-2020.jpg',
  'https://fdn2.gsmarena.com/vv/bigpic/apple-watch-8se-2022.jpg',
];

List word = [];
