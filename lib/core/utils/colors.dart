import 'package:flutter/material.dart';

class AppColors {
  static const accent = Color(0xFFFFB930);
  static const scaffoldBackground = Colors.black;
  static const text = Colors.white;
  static const subtitle = Color(0xFFD2D2D2);
  static const subtitle2 = Color(0x50FFFFFF);
  static const subtitle3 = Color(0xFFC9C9C9);
  static const subtitle4 = Color(0x50FFFFFF);
  static const subtitle5 = Color(0x50D2D2D2);
  static const cardBackground = Color(0x3223232D);
  static const elevatedButtonBackground = Color(0xAFFFFFF);
  static const flatButtonText = Color(0xFFD5D5D5);
  static const searchbarBackground = Color(0xFF191919);

  static const fullPink = Color(0xFFFF5B5B);
  static const fullOrange = Color(0xFFE17000);
  static const fullSkyBlue = Color(0xFF0074A9);
  static const fullGreen = Color(0xFF038D00);
  static const fullPurple = Color(0xFF7500CF);
  static const fullDeepBlue = Color(0xFF002BB6);
}

class MaterialColorMaps {
  static const Map<int, Color> accentMap = {
    50: Color(0xFFFFB930),
    100: Color(0xFFFFB930),
    200: Color(0xFFFFB930),
    300: Color(0xFFFFB930),
    400: Color(0xFFFFB930),
    500: Color(0xFFFFB930),
    600: Color(0xFFFFB930),
    700: Color(0xFFFFB930),
    800: Color(0xFFFFB930),
    900: Color(0xFFFFB930),
  };
}

class MaterialAppColors {
  static const MaterialColor accentMaterial = MaterialColor(
    0xFFFFB930,
    MaterialColorMaps.accentMap,
  );
}
