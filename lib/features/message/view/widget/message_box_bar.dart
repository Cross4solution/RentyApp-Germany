import '../../../../core/_core_exports.dart';

class MessageBoxAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MessageBoxAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.red,
      centerTitle: true,
      title: const Text('Mesajlar'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
