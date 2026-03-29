import 'package:chat_app/core/theme/color_schemes/light/light.dart';
import 'package:flutter/material.dart';

final lightMenuTheme = MenuThemeData(
  style: MenuStyle(
    maximumSize: WidgetStatePropertyAll(Size(200, 300)),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    side: WidgetStateBorderSide.resolveWith(
      (states) => BorderSide(color: LightConstants.neutral300, width: 1.0),
    ),
  )
);