import 'package:prudential_test/utils/colors.dart';
import 'package:flutter/material.dart';

class Fonts {
  static const String RobotoThin = 'RobotoThin';
  static const String RobotoThinItalic = 'RobotoThinItalic';
  static const String RobotoMedium = 'RobotoMedium';
  static const String RobotoMediumItalic = 'RobotoMediumItalic';
  static const String RobotoRegular = 'RobotoRegular';
  static const String RobotoRegularItalic = 'RobotoItalic';
  static const String RobotoLight = 'RobotoLight';
  static const String RobotoLightItalic = 'RobotoLightItalic';
  static const String RobotoBold = 'RobotoBold';
  static const String RobotoBoldItalic = 'RobotoBoldItalic';
  static const String RobotoBlack = 'RobotoBlack';
  static const String RobotoBlackItalic = 'RobotoBlackItalic';
}

class Ts {
  static const robotoExtraSmall = TextStyle(
      color: Cc.black,
      fontWeight: FontWeight.normal,
      fontFamily: Fonts.RobotoLight,
      fontSize: 8);
  static const robotoSmall = TextStyle(
      color: Cc.white,
      fontWeight: FontWeight.normal,
      fontFamily: Fonts.RobotoThin,
      fontSize: 10);
  static const robotoMedium = TextStyle(
      color: Cc.black,
      fontWeight: FontWeight.normal,
      fontFamily: Fonts.RobotoRegular,
      fontSize: 14);
  static const robotoLarge = TextStyle(
      color: Cc.black,
      fontWeight: FontWeight.normal,
      fontFamily: Fonts.RobotoBold,
      fontSize: 20);
}
