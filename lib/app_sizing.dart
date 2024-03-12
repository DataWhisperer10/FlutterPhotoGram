import 'package:flutter/material.dart';

class AppSizing {
  AppSizing._();
  static late double screenHeight;
  static late double screenWidth;
  static init(context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
  }

  static double screenSizeonWidth(fontSize) {
    return (fontSize / 375) * screenWidth;
  }

  static double screenSizeonHeight(fontSize) {
    return (fontSize / 812) * screenHeight;
  }
}
