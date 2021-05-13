import 'package:flutter/material.dart';
import 'package:satturno_app/utils/constants/my_colors.dart';

class MyCircularProgress extends StatelessWidget {
  final Color cor;
  final double size;
  MyCircularProgress([this.cor, this.size = 30.0]);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: cor == null ? MyColors.white : Colors.transparent,
      child: Center(
        child: SizedBox(
          height: size,
          width: size,
          child: CircularProgressIndicator(
            backgroundColor: cor == null ? MyColors.primary : cor,
          ),
        ),
      ),
    );
  }
}
