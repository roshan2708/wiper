import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'constants/colors.dart';

void main() {
  runApp(const TheWipherApp());
}

class TheWipherApp extends StatelessWidget {
  const TheWipherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Wipher',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        useMaterial3: true,
        fontFamily: 'SF Pro Display',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 28,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.5,
          ),
          iconTheme: IconThemeData(color: AppColors.textPrimary),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}