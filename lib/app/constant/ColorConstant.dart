import 'dart:ui';

import 'package:flutter/material.dart';

class ColorConstants {
  // static Color colorPrimary = fromHex("#10234E");
  // static Color lightPrimary = fromHex("#375DB7");
  // static Color textGray = fromHex("#9E9E9E");
  // static Color borderColor = fromHex("#F2F2F2");
  // static Color placeholderColor = fromHex("#7B7E84");
  // static Color bgColor = fromHex("#F2F5F7");
  static Color introgrey = fromHex("#999999");
  static Color black = fromHex("#000000");
  // static Color darkYellow = fromHex("#E8992A");
  // static Color buttonBGColor = fromHex("#1E3F8E");

  // static Color introBlueColor = fromHex("#001D63");
  // static Color colorOTPTextfieldBG = fromHex("#F5F5F5");

  // static Color searchBackgroundColor = fromHex("#F8F9FB");

  // static Color whereFromRecentSearchTextColor = fromHex("#7C7C7C");
  // static Color red = fromHex("#FE304C");

  // static Color white = fromHex("#FFFFFF");

  // static Color hintColor = fromHex("#353535").withOpacity(65);
  // static Color textFieldBorderColor = fromHex("#353535").withOpacity(20);

  // static Color dividerColor = Colors.grey[100];

  static MaterialColor accentCustomColor =
      MaterialColor(0xFF2B0DB2, accentColor);

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

Map<int, Color> color = {
  50: Color.fromRGBO(255, 206, 15, .1),
  100: Color.fromRGBO(255, 206, 15, .2),
  200: Color.fromRGBO(255, 206, 15, .3),
  300: Color.fromRGBO(255, 206, 15, .4),
  400: Color.fromRGBO(255, 206, 15, .5),
  500: Color.fromRGBO(255, 206, 15, .6),
  600: Color.fromRGBO(255, 206, 15, .7),
  700: Color.fromRGBO(255, 206, 15, .8),
  800: Color.fromRGBO(255, 206, 15, .9),
  900: Color.fromRGBO(255, 206, 15, 1),
};

Map<int, Color> accentColor = {
  50: Color.fromRGBO(45, 13, 178, .1),
  100: Color.fromRGBO(45, 13, 178, .2),
  200: Color.fromRGBO(45, 13, 178, .3),
  300: Color.fromRGBO(45, 13, 178, .4),
  400: Color.fromRGBO(45, 13, 178, .5),
  500: Color.fromRGBO(45, 13, 178, .6),
  600: Color.fromRGBO(45, 13, 178, .7),
  700: Color.fromRGBO(45, 13, 178, .8),
  800: Color.fromRGBO(45, 13, 178, .9),
  900: Color.fromRGBO(45, 13, 178, 1),
};

MaterialColor colorCustom = MaterialColor(0xffffce0f, color);
