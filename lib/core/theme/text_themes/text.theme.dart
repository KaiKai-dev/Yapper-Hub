import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatAppTextTheme {
  // Light Mode Colors
  static const Color lightPrimary = Color(0xFF050505); // Near black
  static const Color lightSecondary = Color(0xFF65676B); // Deep gray
  
  // Dark Mode Colors
  static const Color darkPrimary = Color(0xFFFFFFFF);
  static const Color darkSecondary = Color(0xFFB0B3B8); // Light gray
  static const Color messengerBlue = Color(0xFF5664F5); // Your custom hex

  static TextTheme _buildTheme(Color primaryColor, Color secondaryColor) {
    return TextTheme(
      
      // --- DISPLAY: Massive headers (Settings headings, Welcome screens) ---
      displayLarge: GoogleFonts.inter(
        fontSize: 57, fontWeight: FontWeight.w800, color: primaryColor, letterSpacing: -1.0, height: 1.14
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 44, fontWeight: FontWeight.w800, color: primaryColor, letterSpacing: -0.8, height: 1.18
      ),
      displaySmall: GoogleFonts.inter(
        fontSize: 36, fontWeight: FontWeight.w800, color: primaryColor, letterSpacing: -0.5, height: 1.22
      ),

      // --- HEADLINE: Screen titles (e.g., "Chats", "People") ---
      headlineLarge: GoogleFonts.inter(
        fontSize: 32, fontWeight: FontWeight.w400, color: primaryColor, height: 1.25
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 28, fontWeight: FontWeight.w400, color: primaryColor, height: 1.29
      ),
      headlineSmall: GoogleFonts.inter(
        fontSize: 24, fontWeight: FontWeight.w400, color: primaryColor, height: 1.33
      ),

      // --- TITLE: List items and Sub-headers (Chat names, Settings categories) ---
      titleLarge: GoogleFonts.inter(
        fontSize: 22, fontWeight: FontWeight.w500, color: primaryColor, letterSpacing: -0.2, height: 1.27
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 16, fontWeight: FontWeight.w500, color: primaryColor, height: 1.5
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: 14, fontWeight: FontWeight.w500, color: primaryColor, height: 1.43
      ),

      // --- BODY: The "Meat" (Actual messages, long descriptions) ---
      bodyLarge: GoogleFonts.inter(
        fontSize: 16, fontWeight: FontWeight.w400, color: primaryColor, height: 1.5
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14, fontWeight: FontWeight.w400, color: primaryColor, height: 1.43
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 12, fontWeight: FontWeight.w400, color: secondaryColor, height: 1.33
      ),

      // --- LABEL: Metadata and Buttons (Timestamps, "Active now", Button text) ---
      labelLarge: GoogleFonts.inter( // Used for primary buttons
        fontSize: 14, fontWeight: FontWeight.w600, color: messengerBlue, height: 1.43
      ),
      labelMedium: GoogleFonts.inter(
        fontSize: 12, fontWeight: FontWeight.w600, color: secondaryColor, height: 1.33
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 10, fontWeight: FontWeight.w600, color: secondaryColor, height: 1.6
      ),
    );
  }

  static TextTheme get light => _buildTheme(lightPrimary, lightSecondary);
  static TextTheme get dark => _buildTheme(darkPrimary, darkSecondary);
}