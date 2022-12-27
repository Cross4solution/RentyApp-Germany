import 'package:rent_app_germany/features/add_product/controller/product_controller.dart';
import 'package:rent_app_germany/features/home/view/page/home_page.dart';
import 'package:rent_app_germany/features/profile/view/widget/profile_app_bar.dart';
import 'package:rent_app_germany/features/profile/view/widget/rented_history_card.dart';

import '../../../../core/_core_exports.dart';
import '../widget/favorite_products.dart';
import '../widget/profile_card.dart';
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
            children:  [
              ProfileCard(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Kiralama İsteklerim', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),

                  Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey.shade500,size: 20 ,)
                ],
              ),

              Divider(), 
              const Padding( 
                padding: EdgeInsets.only(left: 12, bottom: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Beğendiklerim',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
               FavoriteProducts(),
              const Padding(
                padding: EdgeInsets.only(left: 12, bottom: 8, top: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Kiraladıklarım',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              RentedCard(),
              Padding(
                padding: EdgeInsets.only(left: 12, bottom: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Kiralama Geçmişim',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              RentedHistoryCard()
            ],
          ),
        ),
      ),
    );
  }
}
