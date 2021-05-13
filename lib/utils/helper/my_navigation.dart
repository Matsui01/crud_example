import 'package:flutter/material.dart';

class MyNavigation {
  static void push(BuildContext context, dynamic screen) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  static void replacement(BuildContext context, dynamic screen) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }
  
  static void pushAnimatedPage(BuildContext context, dynamic page) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 500),
        pageBuilder: (_, __, ___) {
          return page;
        },
      ),
    );
  }
}
