import '../_core_exports.dart';

ScaffoldMessengerState customSnackBar({
  required String text,
  required BuildContext context,
  final BorderRadius? borderRadius,
  final EdgeInsets? padding,
  final Duration? duration,
  final SnackBarAction? snackBarAction,
  final int? seconds,
  required final Color color,
  final SnackBarBehavior? behavior,
  final EdgeInsetsGeometry? margin,
}) {
  
  return ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(
      
      SnackBar(

        backgroundColor: color,

        content: Column(
          children: [

            Icon(Icons.warning_amber_rounded, color: Colors.white,size: 46),
            Text(text, textAlign: TextAlign.center, ),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: borderRadius ?? BorderRadius.circular(8)),
        // padding: EdgeInsets.all(16),
        duration: duration ??  Duration(seconds: seconds ?? 4),
        action: snackBarAction,

        margin: margin 
        ?? EdgeInsets.symmetric(vertical: 260, horizontal: 16),


      ),
    );
}
