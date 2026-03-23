import 'package:flutter/material.dart';

class LightConstants {
  LightConstants();

  // Primary: Vibrant Blue #0084FF
  static final primary50 = Color(0xFFECF0FF);
  static final primary100 = Color(0xFFD6E3FF);
  static final primary200 = Color(0xFFA9C7FF);
  static final primary300 = Color(0xFF79ACFF);
  static final primary400 = Color(0xFF3C90FF);
  static final primary500 = Color(0xFF0075E4); // Base Primary from image
  static final primary600 = Color(0xFF005DB7);
  static final primary700 = Color(0xFF00468C);
  static final primary800 = Color(0xFF003063);
  static final primary900 = Color(0xFF001B3D);

  // Secondary: Light Gray/Silver #E4E6EB (Used for containers)
  static final secondary50 = Color(0xFFEFF1F6);
  static final secondary100 = Color(0xFFE0E2E7);
  static final secondary200 = Color(0xFFC4C6CB);
  static final secondary300 = Color(0xFFA9ABB0);
  static final secondary400 = Color(0xFF8E9195); // Base Secondary from image
  static final secondary500 = Color(0xFF74777C);
  static final secondary600 = Color(0xFF5B5F63);
  static final secondary700 = Color(0xFF44474B);
  static final secondary800 = Color(0xFF2D3135);
  static final secondary900 = Color(0xFF191C20);

  // Tertiary: Purple #A459B6
  static final tertiary50 = Color(0xFFFFEBFD);
  static final tertiary100 = Color(0xFFFCD6FF);
  static final tertiary200 = Color(0xFFF3AEFF);
  static final tertiary300 = Color(0xFFDD8DEE);
  static final tertiary400 = Color(0xFFC073D1);
  static final tertiary500 = Color(0xFFA459B6); // Base Tertiary from image
  static final tertiary600 = Color(0xFF88409A);
  static final tertiary700 = Color(0xFF6D2681);
  static final tertiary800 = Color(0xFF540668);
  static final tertiary900 = Color(0xFF340042);

  // Neutral: Background and Text colors
  static final neutral50 = Color(0xFFEFF1F4); // Background (Off-white)
  static final neutral100 = Color(0xFFE0E3E6); // Surface (Cards/containers)
  static final neutral200 = Color(0xFFC4C7CA); // Surface Variant (Search)
  static final neutral300 = Color(0xFFA9ABAE);
  static final neutral400 = Color(0xFF8E9194);
  static final neutral500 = Color(0xFF74777A);
  static final neutral600 = Color(0xFF5C5F61);
  static final neutral700 = Color(0xFF44474A); // Muted Text
  static final neutral800 = Color(0xFF2D3133); // Headline/Body Text
  static final neutral900 = Color(0xFF191C1E); 

  // Error: Destructive Red (Adjusted for light background contrast)
  static final error50  = Color(0xFFFEF2F2);
  static final error100 = Color(0xFFFEE2E2);
  static final error200 = Color(0xFFFECACA);
  static final error300 = Color(0xFFFCA5A5);
  static final error400 = Color(0xFFF87171);
  static final error500 = Color(0xFFEF4444);
  static final error600 = Color(0xFFB31919); // Base color from Daybreak trash button
  static final error700 = Color(0xFF991B1B);
  static final error800 = Color(0xFF7F1D1D);
  static final error900 = Color(0xFF450A0A);

  static ColorScheme get colorScheme => ColorScheme(
    brightness: Brightness.light, 
    primary: primary400, 
    onPrimary: Colors.white, // White text on blue buttons
    secondary: secondary300, 
    onSecondary: neutral50, 
    tertiary: tertiary400,
    onTertiary: Colors.white,
    error: error500, 
    onError: Colors.white, 
    
    // Background and Surface mapping based on "Nebula Daybreak"
    surface: neutral100,            // The #F0F2F5 Background
    onSurface: neutral900,           // Dark text for readability
    surfaceDim: neutral300,
    surfaceContainer: neutral50,    // The #E4E6EB Cards/Containers
    surfaceContainerHigh: neutral900 // Search bar and elevated elements
  );
}