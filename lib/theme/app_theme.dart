// lib/theme/app_theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  // Color palette - elegant dark theme with gradient accents
  static const Color primaryDark = Color(0xFF0A0E27);
  static const Color secondaryDark = Color(0xFF1A1F3A);
  static const Color accentPurple = Color(0xFF6C63FF);
  static const Color accentPink = Color(0xFFE91E63);
  static const Color accentBlue = Color(0xFF00BCD4);
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB0B3C1);
  static const Color cardBackground = Color(0xFF1E2443);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF0A0E27),
      Color(0xFF1A1F3A),
      Color(0xFF2A2F4A),
    ],
  );

  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF6C63FF),
      Color(0xFFE91E63),
    ],
  );

  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF1E2443),
      Color(0xFF2A2F4A),
    ],
  );

  // Theme data
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: accentPurple,
    scaffoldBackgroundColor: primaryDark,
    cardColor: cardBackground,
    fontFamily: 'Sans',
    
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: textPrimary),
      titleTextStyle: TextStyle(
        color: textPrimary,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: textPrimary,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: textPrimary,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        color: textPrimary,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        color: textSecondary,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
    ),
    
    iconTheme: const IconThemeData(
      color: textPrimary,
    ),
    
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: secondaryDark,
      selectedItemColor: accentPurple,
      unselectedItemColor: textSecondary,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),
  );
}