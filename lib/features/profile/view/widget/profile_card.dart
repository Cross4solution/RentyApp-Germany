import 'dart:ui';

import '../../../../core/_core_exports.dart';
import '../../../auth/controller/auth_controller.dart';
import '../../controller/profile_controller.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModel user = sl<AuthController>().userInfo;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 48,
            backgroundColor: Colors.red,
            child: Text(
              "${sl<ProfileController>().userInfo!.name!.substring(0, 1).toUpperCase()} ${sl<ProfileController>().userInfo!.name!.substring(1, 2).toUpperCase()}",
              style: const TextStyle(fontSize: 36, color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
           sl<ProfileController>().userInfo!.name!.toString() ,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
          ),
          const SizedBox(
            height: 16,
          ),
          GestureDetector(
            onTap: () {
              Go.to.page(PageRoutes.profileEditPage);
            },
            child: Container(
              alignment: Alignment.center,
              height: 35,
              width: 155,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Profili Düzenle',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.edit,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
