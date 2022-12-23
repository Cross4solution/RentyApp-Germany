import 'package:rent_app_germany/features/profile/controller/profile_controller.dart';

import '../../../../core/_core_exports.dart';
import '../../../../core/entities/adress_model.dart';

class AdressCard extends StatelessWidget {
  final UserLocation userLocation;
  final int index;
  const AdressCard({
    Key? key,
    required this.userLocation, required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        // constraints: BoxConstraints(minHeight: 50, maxHeight: 175,),

        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(width: 1.5, color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Text(
                      userLocation.title,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Icon(Icons.edit),
                    Spacer(),
                    GestureDetector(onTap: () {
                    sl<ProfileController>().removeAdressId =  userLocation.id!;

                    sl<ProfileController>().removeAdress(index);
                    },
                      child: Icon(Icons.delete))
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                userLocation.city,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                userLocation.address,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                userLocation.postalCode,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
