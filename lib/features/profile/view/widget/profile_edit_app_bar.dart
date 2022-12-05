import '../../../../core/_core_exports.dart';

class ProfileEditAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileEditAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.red,
      leading: GestureDetector(
        onTap: () {
          Go.to.back();
        },
        
        child: const Icon(Icons.arrow_back_ios_new)),
      centerTitle: true,
      title: const Text('Profili Düzenle'),
      
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
