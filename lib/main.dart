import 'package:flutter/material.dart';

import 'screensUI/sign_in.dart';
import 'Theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project X',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system, // Auto-switch based on system setting
      theme: AppThemes.lightTheme,
      // darkTheme: AppThemes.darkTheme,
      home: const SignInScreen(),  //Sign Page
    );
  }
}
