import 'package:flutter_spinkit/flutter_spinkit.dart';

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
        Go.to.pageAndRemoveUntil(PageRoutes.bottomNavigationPage);
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
