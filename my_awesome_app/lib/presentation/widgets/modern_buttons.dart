import 'dart:ui';
import 'package:flutter/material.dart' hide DayPeriod;
import '../../core/constants/app_colors.dart';
import '../../core/utils/time_helper.dart';

class ModernPrimaryButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  const ModernPrimaryButton(
      {super.key, required this.text, required this.onTap});

  @override
  State<ModernPrimaryButton> createState() => _ModernPrimaryButtonState();
}

class _ModernPrimaryButtonState extends State<ModernPrimaryButton> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    final period = TimeHelper.getPeriodByUserTime();
    final accentColor = AppColors.getAccentColor(period);

    return GestureDetector(
      onTapDown: (_) => setState(() => _scale = 0.95),
      onTapUp: (_) => setState(() => _scale = 1.0),
      onTapCancel: () => setState(() => _scale = 1.0),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 100),
        child: Container(
          width: double.infinity,
          height: 58,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                accentColor,
                accentColor.withValues(alpha: 0.7)
              ], // تحديث إلى التابع الجديد لعام 2026
            ),
            boxShadow: [
              BoxShadow(
                color: accentColor.withValues(alpha: 0.4), // تحديث
                blurRadius: 15,
                offset: const Offset(0, 5),
              )
            ],
          ),
          child: Center(
            child: Text(
              widget.text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

class ModernGlassButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  const ModernGlassButton({super.key, required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.glassBackground,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.glassBorder, width: 1.5),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ModernIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const ModernIconButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withValues(alpha: 0.15), // تحديث لنسخة 2026
        border: Border.all(color: Colors.white.withValues(alpha: 0.2)), // تحديث
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white, size: 24),
        onPressed: onTap,
      ),
    );
  }
}

class ModernPulseFAB extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const ModernPulseFAB(
      {super.key, required this.icon, required this.onPressed});

  @override
  State<ModernPulseFAB> createState() => _ModernPulseFABState();
}

class _ModernPulseFABState extends State<ModernPulseFAB>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final period = TimeHelper.getPeriodByUserTime();
    final accentColor = AppColors.getAccentColor(period);

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 65 + (_controller.value * 15),
              height: 65 + (_controller.value * 15),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: accentColor.withValues(
                    alpha: 1.0 - _controller.value), // تحديث
              ),
            ),
            FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: accentColor,
              elevation: 4,
              onPressed: widget.onPressed,
              child: Icon(widget.icon, color: Colors.white, size: 28),
            ),
          ],
        );
      },
    );
  }
}
