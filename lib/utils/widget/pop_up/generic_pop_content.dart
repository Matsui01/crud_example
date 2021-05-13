import 'package:flutter/material.dart';
import 'package:satturno_app/utils/constants/my_colors.dart';
import 'package:satturno_app/utils/texts/my_text_style.dart';
import 'package:satturno_app/utils/widget/my_button.dart';

class GenericPopContent extends StatelessWidget {
  final Function voidCallback;
  final String text1;
  final String text2;
  final String textButton;
  final String image;
  GenericPopContent({
    @required this.voidCallback,
    @required this.text1,
    @required this.text2,
    @required this.textButton,
    @required this.image,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SizedBox.expand(
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 55,
              top: 0,
              left: 20,
              right: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Image.asset(
                        image,
                        height: 120,
                        width: 120,
                        filterQuality: FilterQuality.high,
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 28),
                      child: Text(
                        text1,
                        textAlign: TextAlign.center,
                        style: MyTextStyle.normalStyle(fontSize: 24),
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        text2,
                        textAlign: TextAlign.center,
                        style: MyTextStyle.normalStyle(fontSize: 20, color: MyColors.black),
                      )),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              left: 20,
              child: MyButton(
                callback: voidCallback,
                text: textButton,
                color: MyColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
