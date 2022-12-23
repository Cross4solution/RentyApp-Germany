import 'package:rent_app_germany/features/profile/controller/profile_controller.dart';

import '../../../../core/_core_exports.dart';
import '../widget/adress_card.dart';

class AdressPage extends StatefulWidget {
  const AdressPage({super.key});

  @override
  State<AdressPage> createState() => _AdressPageState();
}

class _AdressPageState extends State<AdressPage> {
  @override
  void initState() {
    sl<ProfileController>().getAdress();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leading: SizedBox.shrink(),
        title: const Text('Adreslerim'),centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Consumer(
              builder: (context, ProfileController profileController, child) {
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: profileController.adressList.length,
                  itemBuilder: (context, index) {
                    final userLocation = profileController.adressList[index];

                    return AdressCard(
                      userLocation: userLocation,
                      index: index,
                    );
                  },
                );
              },
            ),
            const SizedBox(
              height: 8,
            ),
            GestureDetector(
              onTap: () {
                Go.to.page(PageRoutes.adressAddPage);
              },
              child: Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400, width: 2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                child:  Icon(
                  Icons.add,
                  size: 48,
                  color: Colors.grey.shade400,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
