import 'package:flutter/material.dart';

import 'colors/app_colors_theme.dart';

final themeData = ThemeData(
  brightness: Brightness.light,
  colorSchemeSeed: const Color(0xFFFF8A00),
  useMaterial3: true,
  extensions: const [
    AppColorsTheme(
        orange: Color(0xFFFF8A00),
        orangeDark: Color(0xFFF08200),
        white: Color(0xFFFFFFFF),
        whiteOrange: Color(0xFFFFF4E7),
        grey: Color(0xFF8E8181),
        red: Color(0xFFFE4848),
        redLight: Color(0xFFFFE7E7),
        yellow: Color(0xFFEFFFAD))
  ],
);
