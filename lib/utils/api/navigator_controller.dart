import 'package:flutter/material.dart';

class NavigatorController {
  NavigatorController._internal();

  static final NavigatorController _singleton = NavigatorController._internal();

  factory NavigatorController() {
    return _singleton;
  }
  
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
}
