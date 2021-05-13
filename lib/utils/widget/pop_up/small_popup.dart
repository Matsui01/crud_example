import 'package:flutter/material.dart';
import 'package:satturno_app/utils/constants/my_colors.dart';
import 'package:satturno_app/utils/texts/my_text_style.dart';
import 'package:satturno_app/utils/widget/my_button.dart';

class SmallPopup extends StatelessWidget {
  final String text;
  final String buttonText;
  final Function function;
  final Widget icon;
  SmallPopup({
    @required this.text,
    @required this.buttonText,
    @required this.function,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  text,
                  style: MyTextStyle.normalStyle(),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 25),
              child: icon,
            ),
            MyButton(
              text: buttonText,
              callback: () {
                function();
              },
              color: MyColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
