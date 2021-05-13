import 'package:crud_example/utils/constants/my_colors.dart';
import 'package:crud_example/utils/text/my_text_style.dart';
import 'package:flutter/material.dart';

class MySnack {
  // static void showSnack(String message, GlobalKey<ScaffoldState> _scaffoldKey, bool warning,
  //     [int seconds = 3, Color color]) {
  //   try {
  //     _scaffoldKey.currentState.removeCurrentSnackBar();
  //     _scaffoldKey.currentState.showSnackBar(
  //       SnackBar(
  //         content: Text(message),
  //         backgroundColor: color == null
  //             ? warning
  //                 ? Colors.red
  //                 : MyColors.orange
  //             : color,
  //         duration: Duration(seconds: seconds),
  //       ),
  //     );
  //   } catch (e) {
  //     print('Erro ao exibir SnackBar com a mensagem⇝ $message \n $e');
  //   }
  // }
  static void showSnack(String message, GlobalKey<ScaffoldState> _scaffoldKey, bool warning,
      [int seconds = 3, Color color]) {
    try {
      warning = true;
      _scaffoldKey.currentState.removeCurrentSnackBar();
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Container(
            // margin: EdgeInsets.only(bottom: MyMargin.mainMargin),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: color == null
                  ? warning
                      ? MyColors.error
                      : MyColors.secondary
                  : color,
            ),
            child: Container(
              // margin: EdgeInsets.only(right: MyMargin.mainMargin, left: MyMargin.mainMargin, top: 5),

              child: Text(
                message,
                style: MyTextStyle.normalStyle(
                  // color: warning ? MyColors.font : MyColors.white,
                  color: MyColors.white,
                ),
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          // margin: EdgeInsets.all(MyMargin.mainMargin),
          // margin: EdgeInsets.only(bottom: MyMargin.mainMargin),
          // width: 50,
          // margin: EdgeInsets.zero,
          duration: Duration(seconds: seconds),
        ),
      );
    } catch (e) {
      print('Erro ao exibir SnackBar com a mensagem⇝ $message \n $e');
    }
  }
}
