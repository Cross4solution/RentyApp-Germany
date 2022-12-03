import 'package:provider/provider.dart';
import 'package:rent_app_germany/features/bottom_navigation_bar/_bottom_navigation_bar_exports.dart';

import '../../../../core/_core_exports.dart';


class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> with RouteAware {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Consumer(
        builder: (BuildContext context, BottomNavigationBarProvider provider, Widget? child) {
          return Scaffold(
       
            backgroundColor: provider.selectedBarState.pageBackGroundColor(),
            bottomNavigationBar: CustomBottomNavigationBar(),
            body: provider.selectedBarState.buildBody(),
          );
        },
      ),
    );
  }
}
