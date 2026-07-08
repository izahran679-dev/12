import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: 'Tajawal',
      scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A)),
        bodyLarge: TextStyle(fontSize: 16, color: Color(0xFF334155)),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: 'Tajawal',
      scaffoldBackgroundColor: const Color(0xFF0F172A),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
            fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        bodyLarge: TextStyle(fontSize: 16, color: Color(0xFFE2E8F0)),
      ),
    );
  }
}
