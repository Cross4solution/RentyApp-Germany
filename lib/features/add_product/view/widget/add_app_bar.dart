import '../../../../core/_core_exports.dart';

class AddProductAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AddProductAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.red,
      centerTitle: true,
      title: const Text('Ürün Ekle'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
