import '../../../../core/_core_exports.dart';
import '../../domain/entities/bottom_navigation_bar_state.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  final Function() onTap;

  final bool isActive;
  final BottomNavigationBarState barState;

  const CustomBottomNavigationBarItem({
    Key? key,
    required this.onTap,
    this.isActive = false,
    required this.barState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          highlightColor: Colors.transparent,
          borderRadius: AppBorderRadius.borderRadiusAll_12px,
          child: Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: SizedBox(
              width: ScreenSize().getWidthPercent(.18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: ScreenSize().getWidthPercent(.068),
                    child: SvgPicture.asset(
                      barState.stateToAssetPath(),
                      height: 36,
                      color: isActive
                          ? barState.stateToActiveColor()
                          : ColorHelper.blackColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
