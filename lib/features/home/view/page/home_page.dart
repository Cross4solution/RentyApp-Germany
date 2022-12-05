import 'package:carousel_slider/carousel_slider.dart';
import 'package:rent_app_germany/core/_core_exports.dart';
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
      backgroundColor: ColorHelper.backgroundColor,
      appBar: const HomePageAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SlidableTrendsCard(),
            Padding(
              padding: EdgeInsets.only(left: 10, bottom: 8),
              child: Text(
                'Kategoriler',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            CategoryCard(),
            Padding(
              padding: EdgeInsets.only(left: 10, bottom: 8),
              child: Text('Sizin İçin Önerilenler',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
            ),
            RecommendedCard(),
            RecommendedCard(),
            RecommendedCard(),
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
