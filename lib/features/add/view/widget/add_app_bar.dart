import '../../../../core/_core_exports.dart';

class AddAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AddAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.red,
      centerTitle: true,
      title: const Text('Ekle'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
