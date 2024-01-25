// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

/// A class that defines the color scheme for the Eleven Dash App.
///
/// This class extends the `ThemeExtension` class and provides a set of colors
/// that can be used to style the app's UI elements. The colors are defined as
/// instance variables and can be accessed directly. The class also provides
/// methods to create copies of the theme with modified colors and to interpolate
/// between two themes.
class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  final Color orange;
  final Color orangeDark;
  final Color white;
  final Color whiteOrange;
  final Color grey;
  final Color red;
  final Color redLight;
  final Color yellow;

  const AppColorsTheme({
    required this.orange,
    required this.orangeDark,
    required this.white,
    required this.whiteOrange,
    required this.grey,
    required this.red,
    required this.redLight,
    required this.yellow,
  });

  @override
  ThemeExtension<AppColorsTheme> copyWith({
    Color? orange,
    Color? orangeDark,
    Color? white,
    Color? whiteOrange,
    Color? grey,
    Color? red,
    Color? redLight,
    Color? yellow,
  }) {
    return AppColorsTheme(
      orange: orange ?? this.orange,
      orangeDark: orangeDark ?? this.orangeDark,
      white: white ?? this.white,
      whiteOrange: whiteOrange ?? this.whiteOrange,
      grey: grey ?? this.grey,
      red: red ?? this.red,
      redLight: redLight ?? this.redLight,
      yellow: yellow ?? this.yellow,
    );
  }

  @override
  AppColorsTheme lerp(AppColorsTheme? other, double t) {
    return AppColorsTheme(
      orange: Color.lerp(
        orange,
        other?.orange,
        t,
      )!,
      orangeDark: Color.lerp(
        orangeDark,
        other?.orangeDark,
        t,
      )!,
      white: Color.lerp(
        white,
        other?.white,
        t,
      )!,
      whiteOrange: Color.lerp(
        whiteOrange,
        other?.whiteOrange,
        t,
      )!,
      grey: Color.lerp(
        grey,
        other?.grey,
        t,
      )!,
      red: Color.lerp(
        red,
        other?.red,
        t,
      )!,
      redLight: Color.lerp(
        redLight,
        other?.redLight,
        t,
      )!,
      yellow: Color.lerp(
        yellow,
        other?.yellow,
        t,
      )!,
    );
  }
}
