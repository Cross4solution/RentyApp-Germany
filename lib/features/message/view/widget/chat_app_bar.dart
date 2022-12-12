import '../../../../core/_core_exports.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: GestureDetector(
          onTap: () {
            Go.to.back();
          },
          child: const Icon(Icons.arrow_back_ios_new_rounded)),
      title: Row(
        children: [
          Container(
            alignment: Alignment.center,
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const Text(
              'Y K',
              style: TextStyle(color: Colors.red),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          const Text('Yasin Karacan')
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
