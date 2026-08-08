import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Solarized Light Palette
  static const Color background = Color(0xFFFDF6E3); // Solarized base3
  static const Color surface = Color(0xFFEEE8D5); // Solarized base2
  static const Color surfaceLight = Color(0xFFE6DFCC); // Solarized base1.5
  static const Color cardBorder = Color(0xFFD3CBB7); // Solarized border

  // Solarized Accents
  static const Color cyanAccent = Color(0xFF2AA198); // Solarized Cyan
  static const Color blueAccent = Color(0xFF268BD2); // Solarized Blue
  static const Color indigoAccent = Color(0xFF6C71C4); // Solarized Violet
  static const Color emeraldAccent = Color(0xFF859900); // Solarized Green
  static const Color amberAccent = Color(0xFFB58900); // Solarized Yellow/Gold

  // Solarized Text Colors
  static const Color textPrimary = Color(0xFF002B36); // Solarized base03
  static const Color textSecondary = Color(0xFF475B62); // Solarized base01
  static const Color textMuted = Color(0xFF657B83); // Solarized base00

  // Gradients
  static const LinearGradient cyanBlueGradient = LinearGradient(
    colors: [cyanAccent, blueAccent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient indigoPurpleGradient = LinearGradient(
    colors: [indigoAccent, Color(0xFFD33682)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static ThemeData get lightTheme {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: background,
      primaryColor: blueAccent,
      colorScheme: const ColorScheme.light(
        primary: blueAccent,
        secondary: cyanAccent,
        surface: surface,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.outfit(
          color: textPrimary,
          fontSize: 52,
          fontWeight: FontWeight.w800,
          height: 1.1,
        ),
        displayMedium: GoogleFonts.outfit(
          color: textPrimary,
          fontSize: 38,
          fontWeight: FontWeight.bold,
          height: 1.2,
        ),
        displaySmall: GoogleFonts.outfit(
          color: textPrimary,
          fontSize: 28,
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: GoogleFonts.outfit(
          color: textPrimary,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: GoogleFonts.inter(
          color: textSecondary,
          fontSize: 16,
          height: 1.6,
        ),
        bodyMedium: GoogleFonts.inter(
          color: textSecondary,
          fontSize: 14,
          height: 1.5,
        ),
        labelLarge: GoogleFonts.firaCode(
          color: blueAccent,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  static ThemeData get darkTheme => lightTheme;
}
