import '../../../../core/_core_exports.dart';

class TextButtonWidget extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final Color textColor;
  final Color color;
  final IconData? iconLeft;
  final IconData? iconRight;
  final Color? iconColor;

  const TextButtonWidget({
    Key? key,
    required this.text,
    required this.textColor,
    required this.color,
    this.onTap,
    this.iconLeft,
    this.iconRight,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iconLeft != null) ...[
                Icon(iconLeft, color: iconColor,),
                const SizedBox(
                  width: 8,
                )
              ],
              Text(
                text,
                style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
              ),
              if (iconRight != null) ...[
                const SizedBox(
                  width: 8,
                ),
                Icon(iconRight, color: iconColor,),
                
              ],
            ],
          ),
        ),
      ),
    );
  }
}
