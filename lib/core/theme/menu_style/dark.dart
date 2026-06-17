import 'package:chat_app/core/theme/color_schemes/dark/dark.dart';
import 'package:flutter/material.dart';

final darkMenuTheme = MenuThemeData(
  style: MenuStyle(
    maximumSize: WidgetStatePropertyAll(Size(200, 300)),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    side: WidgetStateBorderSide.resolveWith(
      (states) => BorderSide(color: DarkConstants.neutral300, width: 1.0),
    ),
  ),
);
