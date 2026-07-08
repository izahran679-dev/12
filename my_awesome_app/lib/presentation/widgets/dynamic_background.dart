import 'package:flutter/material.dart'
    hide DayPeriod; // إخفاء المسمى المتشابه لمنع التعارض
import '../../core/constants/app_colors.dart';
import '../../core/utils/time_helper.dart';

class DynamicBackground extends StatelessWidget {
  final Widget child;
  const DynamicBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final period = TimeHelper.getPeriodByUserTime();
    final gradientColors = AppColors.getBackgroundGradient(period);

    return Stack(
      children: [
        // 1. التدرج اللوني الخلفي الناعم
        AnimatedContainer(
          duration: const Duration(seconds: 2),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: gradientColors,
            ),
          ),
        ),
        // 2. رسم الزخارف الإسلامية والنجوم/الأشعة الهادئة بصرياً
        Positioned.fill(
          child: Opacity(
            opacity: 0.04,
            child: CustomPaint(
              painter: IslamicPatternPainter(period: period),
            ),
          ),
        ),
        // 3. المحتوى الفعلي فوق الخلفية
        SafeArea(child: child),
      ],
    );
  }
}

class IslamicPatternPainter extends CustomPainter {
  final DayPeriod period;
  IslamicPatternPainter({required this.period});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    double side = 80.0;
    for (double x = 0; x < size.width + side; x += side) {
      for (double y = 0; y < size.height + side; y += side) {
        Path path1 = Path()
          ..addRect(
              Rect.fromCenter(center: Offset(x, y), width: side, height: side));
        canvas.drawPath(path1, paint);

        canvas.save();
        canvas.translate(x, y);
        canvas.rotate(0.785398);
        Path path2 = Path()
          ..addRect(Rect.fromCenter(
              center: const Offset(0, 0), width: side, height: side));
        canvas.drawPath(path2, paint);
        canvas.restore();
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
