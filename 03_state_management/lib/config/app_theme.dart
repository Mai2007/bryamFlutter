import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme({bool isDark = false}) => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        brightness: isDark ? Brightness.dark : Brightness.light,
      );
}
