import 'package:chat_app/core/theme/button_themes/filled_button.theme.data.dart';
import 'package:chat_app/core/theme/button_themes/text_button.theme.data.dart';
import 'package:chat_app/core/theme/color_schemes/dark/dark.dart';
import 'package:chat_app/core/theme/color_schemes/light/light.dart';
import 'package:chat_app/core/theme/input_decoration_theme/dark.dart';
import 'package:chat_app/core/theme/input_decoration_theme/light.dart';
import 'package:chat_app/core/theme/menu_style/dark.dart';
import 'package:chat_app/core/theme/menu_style/light.dart';
import 'package:chat_app/core/theme/text_themes/text.theme.dart';
import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  brightness: .light,
  colorScheme: LightConstants.colorScheme,
  textTheme: ChatAppTextTheme.light,
  textButtonTheme: TextButtonThemeData(style: textButtonLight),
  filledButtonTheme: FilledButtonThemeData(style: filledButtonLight),
  inputDecorationTheme: lightDecorationtheme,
  appBarTheme: AppBarThemeData(
    actionsPadding: EdgeInsets.all(16)
  ),
  menuTheme: lightMenuTheme,
  scaffoldBackgroundColor: LightConstants.colorScheme.surface
);

final darkTheme = ThemeData(
  useMaterial3: true,
  brightness: .dark,
  colorScheme: DarkConstants.colorScheme,
  textTheme: ChatAppTextTheme.dark,
  textButtonTheme: TextButtonThemeData(style: textButtonDark),
  filledButtonTheme: FilledButtonThemeData(style: filledButtonDark),
  inputDecorationTheme: darkInputDecorationTheme,
  appBarTheme: AppBarThemeData(
    actionsPadding: EdgeInsets.all(16)
  ),
  menuTheme: darkMenuTheme,
  scaffoldBackgroundColor: DarkConstants.colorScheme.surface,
);