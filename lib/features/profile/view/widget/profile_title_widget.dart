import '../../../../core/_core_exports.dart';

class ProfileTitleWidget extends StatelessWidget {
  final String text;

  final void Function()? onTap;

  const ProfileTitleWidget({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.grey.shade500,
                  size: 20,
                )
              ],
            ),
            const Divider(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}