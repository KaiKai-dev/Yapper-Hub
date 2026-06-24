import 'package:chat_app/core/theme/theme.data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeNotifier extends Notifier<ThemeData> {
  @override
  ThemeData build() => darkTheme;

  ThemeMode? currentTheme;

  void init() {
    currentTheme = ThemeMode.dark;
  }

  void toggleTheme() {
    if (currentTheme == ThemeMode.light){ 
        state = darkTheme;
        currentTheme = ThemeMode.dark;
    } else if (currentTheme == ThemeMode.dark) {
        state = lightTheme;
        currentTheme = ThemeMode.light;
    }
  }
}

final themeProvider = NotifierProvider<ThemeNotifier, ThemeData>(
  () => ThemeNotifier(),
);
