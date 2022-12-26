import '../../../../core/_core_exports.dart';

class TextButtonWidget extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final Color textColor;
  final Color color;
  final IconData? iconLeft;
  final IconData? iconRight;
  final Color? iconColor;
  final double? height;
  final double? width;
  final double? fontSize;

  const TextButtonWidget({
    Key? key,
    required this.text,
    required this.textColor,
    required this.color,
    this.onTap,
    this.iconLeft,
    this.iconRight,
    this.iconColor,
    this.height,
    this.width,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iconLeft != null) ...[
                Icon(
                  iconLeft,
                  color: iconColor,
                ),
                const SizedBox(
                  width: 8,
                )
              ],
              Text(
                text,
                style: TextStyle(color: textColor, fontWeight: FontWeight.w600, fontSize: fontSize),
              ),
              if (iconRight != null) ...[
                const SizedBox(
                  width: 16,
                ),
                Icon(
                  iconRight,
                  color: iconColor,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
