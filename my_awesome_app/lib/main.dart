import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'presentation/screens/home_preview_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SirajApp());
}

class SirajApp extends StatelessWidget {
  const SirajApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Siraj',
      debugShowCheckedModeBanner: false,
      // دعم الثيمين الفاتح والمظلم
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // يتحول حسب نظام الهاتف أو برمجياً لاحقاً
      home: const HomePreviewPage(),
    );
  }
}
