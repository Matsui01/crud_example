import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:satturno_app/utils/constants/my_margin.dart';

class Popup {
  static Future showMyMessage(BuildContext context, dynamic content, [VoidCallback callback]) {
    return showDialog(
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () {
            print("ok");
          },
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              backgroundColor: Color.fromARGB(50, 255, 255, 255),
              elevation: 0,

              insetPadding: EdgeInsets.only(right: MyMargin.mainMargin, left: MyMargin.mainMargin),
              contentPadding: EdgeInsets.all(0),
              // child: content,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  content,
                ],
              ),
            ),
            // Column(
            //   children: <Widget>[
            //     Expanded(
            //       flex: 4,
            //       child: Container(),
            //     ),
            //     Expanded(
            //       flex: 77,
            //       child: Dialog(
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(10.0),
            //         ),
            //         backgroundColor: Color.fromARGB(50, 255, 255, 255),
            //         elevation: 0,
            //         child: content,
            //       ),
            //     ),
            //     Expanded(
            //       flex: 19,
            //       child: Container(),
            //     ),
            //   ],
            // ),
          ),
        );
      },
    ).then((val) {
      if (callback != null) {
        callback();
      }
    });
  }
}
