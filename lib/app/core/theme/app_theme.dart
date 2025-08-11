import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors
  static const Color primaryColor = Color(0xFF1E88E5); // Primary Blue
  static const Color accentColor = Color(0xFF64B5F6); // Light Blue Accent
  static const Color darkBg = Color(0xFF121212);
  static const Color lightBg = Color(0xFFF5F5F5);

  // Card / UI constants
  static final BorderRadius _cardRadius = BorderRadius.circular(16);
  static const double _cardElevation = 4.0;

  // Typography helper
  static TextTheme _textTheme(Brightness brightness) {
    final baseColor = brightness == Brightness.dark
        ? Colors.white
        : Colors.black87;
    final base = GoogleFonts.poppinsTextTheme();

    return base.copyWith(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: baseColor,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: baseColor,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: baseColor,
      ),
      bodyLarge: TextStyle(fontSize: 16, color: baseColor.withOpacity(0.87)),
      bodyMedium: TextStyle(fontSize: 14, color: baseColor.withOpacity(0.7)),
      labelSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: baseColor.withOpacity(0.6),
      ),
    );
  }

  // Light Theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: lightBg,
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: accentColor,
      surface: Colors.white,
      background: lightBg,
      onPrimary: Colors.white,
      onSurface: Colors.black87,
    ),
    textTheme: _textTheme(Brightness.light),
    appBarTheme: AppBarTheme(
      backgroundColor: lightBg,
      foregroundColor: Colors.black87,
      elevation: 0,
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    ),

    // <-- Use CardThemeData to match older SDKs that expect CardThemeData
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: _cardElevation,
      shadowColor: Colors.black.withOpacity(0.08),
      shape: RoundedRectangleBorder(borderRadius: _cardRadius),
    ),

    iconTheme: const IconThemeData(color: Colors.black87),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        elevation: 2,
      ),
    ),
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkBg,
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      secondary: accentColor,
      surface: Color(0xFF1E1E1E),
      background: darkBg,
      onPrimary: Colors.white,
      onSurface: Colors.white70,
    ),
    textTheme: _textTheme(Brightness.dark),
    primaryTextTheme: _textTheme(Brightness.dark),
    appBarTheme: AppBarTheme(
      backgroundColor: darkBg,
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),

    cardTheme: CardThemeData(
      color: const Color(0xFF1E1E1E),
      elevation: _cardElevation,
      shadowColor: Colors.black.withOpacity(0.3),
      shape: RoundedRectangleBorder(borderRadius: _cardRadius),
    ),

    iconTheme: const IconThemeData(color: Colors.white70),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        elevation: 2,
      ),
    ),
  );
}
