import 'package:flutter/material.dart';

class AppColors {
  static const accent = Color(0xFFFFB930);
  static const scaffoldBackground = Colors.black;
  static const text = Colors.white;
  static const subtitle = Color(0xFFD2D2D2);
  static const cardBackground = Color(0x3223232D);
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
