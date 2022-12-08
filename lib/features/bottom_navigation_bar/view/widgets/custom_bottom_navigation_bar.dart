// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:provider/provider.dart';
import '../../../../core/_core_exports.dart';
import '../../_bottom_navigation_bar_exports.dart';


class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, BottomNavigationBarProvider provider, Widget? widget) {
        return AnimatedContainer(
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: ScreenSize().bottomMargin),
          height: provider.isBottomBarVisible ? 55 : 0,
          width: ScreenSize().getWidthPercent(1),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          curve: Curves.linear,
          duration: const Duration(
            milliseconds: 250,
          ),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Container(
              height: 55,
              width: ScreenSize().getWidthPercent(1),
              color: Colors.transparent,
              child: Stack(
                children: [
                  SizedBox(
                    width: ScreenSize().getWidthPercent(1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (BottomNavigationBarState state in BottomNavigationBarState.values)
                          CustomBottomNavigationBarItem(
                            onTap: () {
                              provider.routePage(state);
                            },
                            isActive: provider.selectedBarState == state,
                            barState: state,
                          ),
                      ],
                    ),
                  ),
                  TweenAnimationBuilder<double>(
                    tween: Tween(
                      begin: 0,
                      end: ((ScreenSize().getWidthPercent(1) / BottomNavigationBarState.values.length) *
                          provider.selectedBarState.stateToPageIndex()),
                    ),
                    curve: Curves.easeOutQuint,
                    duration: const Duration(milliseconds: 350),
                    builder: (context, animation, _) {
                      return Positioned(
                        bottom: 0,
                        left: animation,
                        child: Container(
                          height: ScreenSize().getHeightPercent(.005),
                          width: ((ScreenSize().getWidthPercent(1)) / BottomNavigationBarState.values.length),
                          alignment: Alignment.center,
                          color: Colors.transparent,
                          child: Container(
                            width: ScreenSize().getWidthPercent(.25),
                            color: Colors.red,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
