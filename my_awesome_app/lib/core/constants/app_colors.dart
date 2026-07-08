import 'package:flutter/material.dart'
    hide DayPeriod; // إخفاء المسمى المتشابه لمنع التعارض
import '../utils/time_helper.dart';

class AppColors {
  // ألوان ثابتة للخطوط والعناصر الشفافة
  static const Color textLight = Colors.white;
  static const Color textDark = Color(0xFF1E293B); // تم تصحيح القيمة هنا
  static const Color glassBorder = Color(0x33FFFFFF);
  static const Color glassBackground = Color(0x1AFFFFFF);

  // الحصول على التدرج اللوني للخلفية بناءً على فترة اليوم
  static List<Color> getBackgroundGradient(DayPeriod period) {
    switch (period) {
      case DayPeriod.night:
        return [const Color(0xFF0B1020), const Color(0xFF1A1F3A)];
      case DayPeriod.dawn:
        return [
          const Color(0xFF311042),
          const Color(0xFFE65C40),
          const Color(0xFFF9D423)
        ];
      case DayPeriod.morning:
        return [const Color(0xFF56CCF2), const Color(0xFF2F80ED)];
      case DayPeriod.noon:
        return [const Color(0xFFE0F7FA), const Color(0xFF80DEEA)];
      case DayPeriod.afternoon:
        return [const Color(0xFFF1A80A), const Color(0xFFE97411)];
      case DayPeriod.sunset:
        return [
          const Color(0xFFE63946),
          const Color(0xFF457B9D),
          const Color(0xFF1D3557)
        ];
      case DayPeriod.evening:
        return [
          const Color(0xFF0F2027),
          const Color(0xFF203A43),
          const Color(0xFF2C5364)
        ];
    }
  }

  // اللون المميز (Accent) لكل فترة
  static Color getAccentColor(DayPeriod period) {
    switch (period) {
      case DayPeriod.night:
        return const Color(0xFFBB86FC);
      case DayPeriod.dawn:
        return const Color(0xFFFFB74D);
      case DayPeriod.morning:
        return const Color(0xFF00E5FF);
      case DayPeriod.noon:
        return const Color(0xFF00B0FF);
      case DayPeriod.afternoon:
        return const Color(0xFFFFD700);
      case DayPeriod.sunset:
        return const Color(0xFFFF6B6B);
      case DayPeriod.evening:
        return const Color(0xFF81C784);
    }
  }
}
