import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rent_app_germany/features/bottom_navigation_bar/_bottom_navigation_bar_exports.dart';
import 'package:rent_app_germany/features/profile/controller/profile_controller.dart';

import '../../../../core/_core_exports.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (sl<UserModel>().user!.isLogin) {
          sl<ProfileController>().fetchUserInfo();
          print(sl<UserModel>().accessToken);
          Go.to.pageAndRemoveUntil(PageRoutes.bottomNavigationPage);
        } else {
          Go.to.pageAndRemoveUntil(PageRoutes.loginPage);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AssetsPath().logoSplashSVG,
            height: 172,
          ),
          const SizedBox(height: 48),
          SpinKitThreeBounce(color: ColorHelper.primaryColor),
        ],
      ),
    );
  }
}
