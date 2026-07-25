import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color background = Color(0xFF0A0E17);
  static const Color surface = Color(0xFF111827);
  static const Color surfaceLight = Color(0xFF1F293D);
  static const Color cardBorder = Color(0x1AFFFFFF);

  static const Color cyanAccent = Color(0xFF00F2FE);
  static const Color blueAccent = Color(0xFF4FACFE);
  static const Color indigoAccent = Color(0xFF6366F1);
  static const Color emeraldAccent = Color(0xFF10B981);
  static const Color amberAccent = Color(0xFFF59E0B);

  static const Color textPrimary = Color(0xFFF9FAFB);
  static const Color textSecondary = Color(0xFF9CA3AF);
  static const Color textMuted = Color(0xFF6B7280);

  static const LinearGradient cyanBlueGradient = LinearGradient(
    colors: [cyanAccent, blueAccent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient indigoPurpleGradient = LinearGradient(
    colors: [indigoAccent, Color(0xFF8B5CF6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: background,
      primaryColor: cyanAccent,
      colorScheme: const ColorScheme.dark(
        primary: cyanAccent,
        secondary: blueAccent,
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
          color: cyanAccent,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
