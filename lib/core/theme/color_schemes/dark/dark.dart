import 'package:flutter/material.dart';

class DarkConstants {
  DarkConstants();

  static final primary50 = Color(0xFFECF0FF);
  static final primary100 = Color(0xFFD6E3FF);
  static final primary200 = Color(0xFFA9C7FF);
  static final primary300 = Color(0xFF79ACFF);
  static final primary400 = Color(0xFF3C90FF);
  static final primary500 = Color(0xFF0075E4);
  static final primary600 = Color(0xFF005DB7);
  static final primary700 = Color(0xFF00468C);
  static final primary800 = Color(0xFF003063);
  static final primary900 = Color(0xFF001B3D);

  static final secondary50 = Color(0xFFEFF0FF);
  static final secondary100 = Color(0xFFDBE1FF);
  static final secondary200 = Color(0xFFB4C5FF);
  static final secondary300 = Color(0xFF8CA8FF);
  static final secondary400 = Color(0xFF6A8CF1);
  static final secondary500 = Color(0xFF4F72D5);
  static final secondary600 = Color(0xFF3358BA);
  static final secondary700 = Color(0xFF103FA1);
  static final secondary800 = Color(0xFF002979);
  static final secondary900 = Color(0xFF00174C);

  static final tertiary50 = Color(0xFFFCD6FF);
  static final tertiary100 = Color(0xFFFCD6FF);
  static final tertiary200 = Color(0xFFF3AEFF);
  static final tertiary300 = Color(0xFFDD8DEE);
  static final tertiary400 = Color(0xFFC073D1);
  static final tertiary500 = Color(0xFFA459B6);
  static final tertiary600 = Color(0xFF88409A);
  static final tertiary700 = Color(0xFF6D2681);
  static final tertiary800 = Color(0xFF540668);
  static final tertiary900 = Color(0xFF340042);

  static final neutral50 = Color(0xFF000000); // Background
  static final neutral100 = Color(0xFF080808); // Surface (Cards)
  static final neutral200 = Color.fromARGB(255, 22, 22, 22); // Surface Variant (Search)
  static final neutral300 = Color(0xFF474747);
  static final neutral400 = Color(0xFF5E5E5E);
  static final neutral500 = Color(0xFF777777);
  static final neutral600 = Color(0xFF919191);
  static final neutral700 = Color(0xFFABABAB);
  static final neutral800 = Color(0xFFC6C6C6);
  static final neutral900 = Color(0xFFFFFFFF);

  static final error50  = Color(0xFFFFF0EF);
  static final error100  = Color(0xFFFFF0EF);
  static final error200 = Color(0xFFFFDEDC);
  static final error300 = Color(0xFFFFBCB9);
  static final error400 = Color(0xFFFF9A96);
  static final error500 = Color(0xFFFF7873);
  static final error600 = Color(0xFFFF6B60); // Base color from image
  static final error700 = Color(0xFFE66056);
  static final error800 = Color(0xFFCC564D);
  static final error900 = Color(0xFFB34B43);

  static ColorScheme get colorScheme => ColorScheme(
    brightness: Brightness.dark, 
    primary: primary500, 
    onPrimary: neutral900, 
    secondary: secondary500, 
    onSecondary: neutral900, 
    tertiary: tertiary500,
    onTertiary: neutral900,
    error: error500, 
    onError: error800, 
    
    // Background and Surface mapping
    surface: neutral100,            // The #000000 background
    onSurface: neutral900,           // High-contrast text
    surfaceContainer: neutral200,    // The cards/containers
    onSurfaceVariant: neutral900 // Search bar / elevated elements
  );
}