import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFFE2BE7F);
  static const Color secondary = Color(0xFF856B3F);
  static const Color black = Color(0xFF202020);
  static const Color white = Color(0xFFFFFFFF);
  static ThemeData lightTheme = ThemeData(
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: primary,
      selectionColor: primary.withOpacity(0.5),
      selectionHandleColor: primary,
    ),
  );
  static ThemeData darkTheme = ThemeData();
}
