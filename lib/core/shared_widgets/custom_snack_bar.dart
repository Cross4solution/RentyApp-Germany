import '../_core_exports.dart';

ScaffoldMessengerState customSnackBar({
  required String text,
  required BuildContext context,
  final BorderRadius? borderRadius,
  final EdgeInsets? padding,
  final Duration? duration,
  final SnackBarAction? snackBarAction,
  required final Color color,
}) {
  return ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        backgroundColor: color,
        content: Row(
          children: [
            SvgPicture.asset(AssetsPath().logoSVG),
            const SizedBox(
              width: 8,
            ),
            Text(text, textAlign: TextAlign.center, maxLines: 2),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: borderRadius ?? BorderRadius.circular(8)),
        // padding: EdgeInsets.all(16),
        duration: duration ?? const Duration(seconds: 4),
        action: snackBarAction,
      ),
    );
}