import 'package:rent_app_germany/features/home/view/page/home_page.dart';
import 'package:rent_app_germany/features/profile/view/widget/profile_app_bar.dart';
import 'package:rent_app_germany/features/profile/view/widget/rented_history_card.dart';

import '../../../../core/_core_exports.dart';
import '../widget/profile_card.dart';
import '../widget/rented_card_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: const ProfileAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            ProfileCard(),
            Padding(
              padding: EdgeInsets.only(left: 12, bottom: 8),
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
    );
  }
}
