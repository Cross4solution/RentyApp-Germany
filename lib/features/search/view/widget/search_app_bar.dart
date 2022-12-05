import '../../../../core/_core_exports.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.red,
      centerTitle: true,
      title: const Text('İlan Ara'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
