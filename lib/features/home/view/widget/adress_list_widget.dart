import 'package:rent_app_germany/features/add_product/controller/product_controller.dart';

import '../../../../core/_core_exports.dart';
import '../../../profile/controller/profile_controller.dart';

class AdressListWidget extends StatefulWidget {
  const AdressListWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AdressListWidget> createState() => _AdressListWidgetState();
}

class _AdressListWidgetState extends State<AdressListWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      sl<ProfileController>().getAdress();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ProfileController profileController, child) {
        return  profileController.adressList.isEmpty ? GestureDetector(
                      onTap: () {
                        Go.to.page(PageRoutes.adressPage);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Container(
                            alignment: Alignment.center,
                            height: 46,
                            width: 46,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: const Icon(Icons.add)),
                      ),
                    ):
        
         SizedBox(
          height: 48,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: profileController.adressList.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: GestureDetector(
                      onTap: () {
                        profileController.SelectAdress(index);

                        sl<ProductController>().adressId =
                            profileController.adressList[index].id!.toString();

                        print("adressId : "
                            "${sl<ProductController>().adressId}");
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 46,
                        width: 100,
                        decoration: BoxDecoration(
                          color: profileController.expandedAdressIndex == index
                              ? Colors.green
                              : Colors.white,
                          border:
                              Border.all(color: Colors.grey.shade400, width: 2),
                          // color: Colors.amber,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Text(
                          profileController.adressList[index].title,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: index == profileController.adressList.length - 1,
                    child: GestureDetector(
                      onTap: () {
                        Go.to.page(PageRoutes.adressPage);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Container(
                            alignment: Alignment.center,
                            height: 46,
                            width: 46,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: const Icon(Icons.add)),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
