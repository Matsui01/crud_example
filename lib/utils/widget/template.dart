import 'package:flutter/material.dart';
import 'package:satturno_app/utils/constants/my_colors.dart';

class Template {
  static BoxShadow myBoxShadow() {
    return BoxShadow(
      color: Colors.black38,
      blurRadius: 10.0,
      spreadRadius: 0.1,
      offset: Offset(0.1, 0.4),
    );
  }

  static TextStyle myTextStyle0() {
    return TextStyle(
      color: Colors.black38,
      fontSize: 10,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle myTextStyle1() {
    return TextStyle(
      color: Colors.black38,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle myTextStyle2() {
    return TextStyle(
      color: Colors.black87,
      fontSize: 13,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle myTextStyle3() {
    return TextStyle(
      color: Colors.black87,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle myTextStyle4() {
    return TextStyle(
      color: Colors.black87,
      fontSize: 17,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle myTextStyle5() {
    return TextStyle(
      color: Colors.black45,
      fontSize: 16,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle myTextStyle6() {
    return TextStyle(
      color: MyColors.orange,
      fontSize: 17,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle myTextStyle7() {
    return TextStyle(
      color: Colors.black87,
      fontSize: 13,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle myTextStyle8() {
    return TextStyle(
      color: Colors.white,
      fontSize: 13,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle myTextStyle9() {
    return TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
  }
}
