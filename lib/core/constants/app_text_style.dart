import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
//* Medium
  static TextStyle medium20px = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static TextStyle medium15px = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );
  static TextStyle mediumGreyColor14px = const TextStyle(
    fontSize: 14,
    color: ColorHelper.darkGreyColor,
    fontWeight: FontWeight.w600,
  );

  //* Regulars
  static TextStyle regular24px = const TextStyle(
      fontSize: 24, fontWeight: FontWeight.normal, color: ColorHelper.whiteColor);
  static TextStyle regular20px = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.normal, color: ColorHelper.whiteColor);

  static TextStyle regular16px = const TextStyle(
    fontSize: 16,
    color: ColorHelper.whiteColor,
    fontWeight: FontWeight.normal,
  );
  static TextStyle regular14px = const TextStyle(
      fontSize: 14, fontWeight: FontWeight.normal, color: ColorHelper.whiteColor);
  static TextStyle regular15px = const TextStyle(
      fontSize: 15, fontWeight: FontWeight.normal, color: ColorHelper.whiteColor);

  static TextStyle regular12px = const TextStyle(
      fontSize: 12, fontWeight: FontWeight.normal, color: ColorHelper.whiteColor);
  static TextStyle regularPrimaryColor12px =  TextStyle(
    fontSize: 12,
    color: ColorHelper.primaryColor,
    fontWeight: FontWeight.normal,
  );
  static TextStyle regularGreyColor12px = const TextStyle(
    fontSize: 10,
    color: ColorHelper.darkGreyColor,
    fontWeight: FontWeight.normal,
  );

//* Bolds
  static TextStyle bold36px = const TextStyle(
      fontSize: 36, fontWeight: FontWeight.bold, color: ColorHelper.whiteColor);

  static TextStyle bold30px = const TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, color: ColorHelper.whiteColor);  static TextStyle bold24px = const TextStyle(
      fontSize: 24, fontWeight: FontWeight.bold, color: ColorHelper.whiteColor);
  static TextStyle bold32px = const TextStyle(
      fontSize: 32, fontWeight: FontWeight.bold, color: ColorHelper.whiteColor);
  static TextStyle bold18px = const TextStyle(
      fontSize: 18, fontWeight: FontWeight.bold, color: ColorHelper.whiteColor);
  static TextStyle bold10px = const TextStyle(
      fontSize: 10, fontWeight: FontWeight.bold, color: ColorHelper.whiteColor);
  static TextStyle bold20px = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: ColorHelper.whiteColor);
  static TextStyle bold16px = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.bold, color: ColorHelper.whiteColor);
}
