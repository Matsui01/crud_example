import 'package:crud_example/utils/constants/my_colors.dart';
import 'package:flutter/material.dart';

class MyTextStyle {
  static TextStyle normalStyle({Color color, FontWeight fontWeight, double fontSize}) {
    return TextStyle(
      color: color == null ? MyColors.font : color,
      fontWeight: fontWeight == null ? FontWeight.normal : fontWeight,
      fontSize: fontSize == null ? 14 : fontSize,
      // letterSpacing: letterSpacing == null ? 1.0 : letterSpacing
    );
  }
}
