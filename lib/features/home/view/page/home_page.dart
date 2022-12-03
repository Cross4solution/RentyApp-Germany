import 'package:rent_app_germany/core/_core_exports.dart';
import 'package:rent_app_germany/features/home/view/widget/home_page_app_bar.dart';
import 'package:rent_app_germany/features/home/view/widget/recommended_card.dart';
import '../widget/category_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Scaffold(
      backgroundColor: ColorHelper.backgroundColor,
      appBar: const HomePageAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(24)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: CachedNetworkImage(
                  imageUrl:
                      'https://listelist.com/wp-content/uploads/2020/06/ambroise-nicolao-zK9O6EzP1Lw-unsplash-scaled.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, bottom: 8),
              child: Text(
                'Kategoriler',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const CategoryCard(),
            const Padding(
              padding: EdgeInsets.only(left: 10, bottom: 8),
              child: Text('Sizin İçin Önerilenler',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
            ),
            const RecommendedCard(),
            const RecommendedCard(),
            const RecommendedCard(),
          ],
        ),
      ),
    );
  }
}

List  image = [
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
