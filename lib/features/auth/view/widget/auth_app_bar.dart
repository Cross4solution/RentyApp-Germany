import '../../../../core/_core_exports.dart';

class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;

  const AuthAppBar({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(

      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Go.to.back();
        },
        child: const Icon(Icons.arrow_back_ios),
      ),
      titleSpacing: 0,
      centerTitle: false,
      title: Text(
        text,
        style: AppTextStyles.bold24px,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
