import 'package:flutter/material.dart';
import 'package:satturno_app/utils/constants/my_colors.dart';
import 'package:satturno_app/utils/widget/my_button.dart';

class SmallPopupDobleButton extends StatelessWidget {
  final String buttonText1;
  final String buttonText2;
  final Function function1;
  final Function function2;
  final Widget content;
  SmallPopupDobleButton({
    @required this.buttonText1,
    @required this.buttonText2,
    @required this.function1,
    @required this.function2,
    @required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 150,
      ),
      child: Container(
        // height: 200,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            content,
            Row(
              children: [
                Expanded(
                  child: MyButton(
                    text: buttonText1,
                    color: MyColors.primary,
                    // margin: EdgeInsets.only(right: MyMargin.mainMargin, left: MyMargin.mainMargin),
                    callback: () {
                      function1();
                    },
                  ),
                ),
                Expanded(
                  child: MyButton(
                    text: buttonText2,
                    color: MyColors.primary,
                    // margin: EdgeInsets.only(right: MyMargin.mainMargin, left: MyMargin.mainMargin),
                    callback: () {
                      function2();
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
