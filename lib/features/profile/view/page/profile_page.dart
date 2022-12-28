import 'package:rent_app_germany/features/add_product/controller/product_controller.dart';
import 'package:rent_app_germany/features/home/view/page/home_page.dart';
import 'package:rent_app_germany/features/profile/view/widget/profile_app_bar.dart';
import 'package:rent_app_germany/features/profile/view/widget/rented_history_card.dart';

import '../../../../core/_core_exports.dart';
import '../widget/favorite_products.dart';
import '../widget/profile_card.dart';
import '../widget/profile_title_widget.dart';
import '../widget/rented_card_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfileAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const ProfileCard(),
               ProfileTitleWidget(text: 'Alıcı İsteklerim',onTap: () {

                Go.to.page(PageRoutes.sellerOrdersPage);
                
              },),
               ProfileTitleWidget(text: 'Siparişlerim', onTap: () {

                Go.to.page(PageRoutes.orderListPage);
                
              },),
              ProfileTitleWidget(
                text: 'Beğendiklerim',
                onTap: () {
                  Go.to.page(PageRoutes.myFavoritesPage);
                },
              ),
              const ProfileTitleWidget(text: 'Kiraladıklarım'),
              const ProfileTitleWidget(text: 'Kiralama Geçmişim'),
            ],
          ),
        ),
      ),
    );
  }
}


