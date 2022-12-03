import '../../../../core/_core_exports.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: ColorHelper.primaryColor,
      centerTitle: true,
      title: SvgPicture.asset(
        AssetsPath().logoSVG,
        height: 32,
      ),
      actions: [
        Container(
          alignment: Alignment.center,
          width: 65,
          child: Stack(
            children: const [
              Icon(Icons.notifications, size: 32),
              Positioned(
                top: 3,
                right: 3,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 6,
                  child: CircleAvatar(
                    backgroundColor: Colors.yellow,
                    radius: 5,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
