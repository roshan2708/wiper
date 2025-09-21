import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF8B5CF6); 
  static const Color secondary = Color(0xFF6366F1); 
  static const Color accent = Color(0xFF3B82F6); 
  static const Color background = Color(0xFF0F0F0F); 
  static const Color cardBackground = Color(0xFF1A1A1A); 
  static const Color surface = Color(0xFF262626); 
  static const Color textPrimary = Color(0xFFFFFFFF); 
  static const Color textSecondary = Color(0xFFA1A1AA); 
  static const Color success = Color(0xFF22C55E); 
  static const Color warning = Color(0xFFFBBF24); 
  static const Color error = Color(0xFFF87171); 
  static const Color disabled = Color(0xFF525252); 
  
  // Gradient colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF8B5CF6), Color(0xFF6366F1)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFF1A1A1A), Color(0xFF262626)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}