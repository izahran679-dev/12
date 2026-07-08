import 'dart:ui';
import 'package:flutter/material.dart';

class HomePreviewPage extends StatefulWidget {
  const HomePreviewPage({super.key});

  @override
  State<HomePreviewPage> createState() => _HomePreviewPageState();
}

class _HomePreviewPageState extends State<HomePreviewPage> {
  // تم تحويل المتغيرات الثابتة حالياً إلى final لتلبية شروط الفحص ومنع التحذيرات
  final String _fajr = "03:20";
  final String _dhuhr = "11:39";
  final String _asr = "03:02";
  final String _maghrib = "06:28";
  final String _isha = "07:57";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF030712), // أسود ليل عميق فاخر
      body: Center(
        child: Container(
          constraints: const BoxConstraints(
              maxWidth: 430), // حصر العرض لتطابق أبعاد الهاتف
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF0B1528),
                Color(0xFF022C22), // تدرج زيتي ناعم جداً بالخلفية
                Color(0xFF030712),
              ],
            ),
          ),
          child: Stack(
            children: [
              // إضاءة خلفية علوية محيطية ناعمة لتأثير الـ Gradient الفخم
              Positioned(
                top: -60,
                right: -40,
                child: Container(
                  width: 260,
                  height: 260,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF10B981).withValues(alpha: 0.12),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 70, sigmaY: 70),
                    child: const SizedBox(),
                  ),
                ),
              ),

              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 30),

                      // الهوية العلوية الأنيقة
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "سِرَاج",
                                style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w900,
                                    color: const Color(0xFFF3F4F6),
                                    letterSpacing: -0.5,
                                    shadows: [
                                      Shadow(
                                        color: const Color(0xFF10B981)
                                            .withValues(alpha: 0.2),
                                        blurRadius: 8,
                                      )
                                    ]),
                              ),
                              const SizedBox(height: 4),
                              const Row(
                                children: [
                                  Icon(Icons.near_me,
                                      color: Color(0xFF10B981), size: 12),
                                  SizedBox(width: 4),
                                  Text(
                                    "الدوحة، قطر",
                                    style: TextStyle(
                                        color: Color(0xFF9CA3AF),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.03),
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Colors.white.withValues(alpha: 0.08)),
                            ),
                            child: const Icon(
                                Icons.notifications_active_outlined,
                                color: Color(0xFF10B981),
                                size: 22),
                          )
                        ],
                      ),

                      const SizedBox(height: 40),

                      // قسم العداد البصري الأساسي
                      const Column(
                        children: [
                          Text(
                            "الأذان القادم وصلاة المغرب خلال",
                            style: TextStyle(
                                color: Color(0xFF9CA3AF),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "02:14:10",
                            style: TextStyle(
                              fontSize: 46,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 40),

                      // كارت مواقيت الصلاة الزجاجي (تم إصلاح أخطاء const وتسمية الألوان بالكامل)
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.03),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                              color: Colors.white.withValues(alpha: 0.08)),
                        ),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Opacity(
                                      opacity: 0.8,
                                      child: Icon(Icons.access_time,
                                          color: Color(0xFF10B981), size: 16),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "مواقيت الصلاة اليوم",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                Text(
                                  "توقيت محلي",
                                  style: TextStyle(
                                      color: Color(0xFF10B981),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 14.0),
                              child: Divider(color: Colors.white10, height: 1),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildPrayerColumn("الفجر", _fajr, false),
                                _buildPrayerColumn("الظهر", _dhuhr, false),
                                _buildPrayerColumn("العصر", _asr, false),
                                _buildPrayerColumn("المغرب", _maghrib, true),
                                _buildPrayerColumn("العشاء", _isha, false),
                              ],
                            )
                          ],
                        ),
                      ),

                      const SizedBox(height: 40),

                      // شريط الأدوات المحدث بأيقونات متنوعة وجميلة
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildModernTab(Icons.explore_outlined, "القبلة"),
                          _buildModernTab(
                              Icons.auto_stories_outlined, "المصحف"),
                          _buildModernTab(
                              Icons.wb_twilight_outlined, "الأذكار"),
                          _buildModernTab(Icons.tune_outlined, "الضبط"),
                        ],
                      ),

                      const Spacer(),

                      // زر الإجراء الرئيسي المضيء والصلب
                      Container(
                        width: double.infinity,
                        height: 56,
                        decoration: BoxDecoration(
                          color: const Color(0xFF10B981),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF10B981)
                                  .withValues(alpha: 0.2),
                              blurRadius: 16,
                              offset: const Offset(0, 4),
                            )
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                          ),
                          child: const Text(
                            "تحديث ومزامنة البيانات الحية",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPrayerColumn(String title, String time, bool isNext) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: isNext ? 12 : 8),
      decoration: BoxDecoration(
        color: isNext
            ? const Color(0xFF10B981).withValues(alpha: 0.12)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isNext
              ? const Color(0xFF10B981).withValues(alpha: 0.25)
              : Colors.transparent,
        ),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: isNext ? const Color(0xFF10B981) : const Color(0xFF9CA3AF),
              fontSize: 13,
              fontWeight: isNext ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            time,
            style: TextStyle(
              color: isNext ? Colors.white : const Color(0xFFE5E7EB),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            title == "الفجر" || title == "الظهر" ? "ص" : "م",
            style: TextStyle(
              color: isNext ? const Color(0xFF10B981) : const Color(0xFF6B7280),
              fontSize: 11,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildModernTab(IconData icon, String text) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.02),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
          ),
          child: Icon(icon, color: const Color(0xFFE5E7EB), size: 22),
        ),
        const SizedBox(height: 8),
        Text(
          text,
          style: const TextStyle(
              color: Color(0xFF9CA3AF),
              fontSize: 13,
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
