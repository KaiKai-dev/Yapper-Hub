import 'package:chat_app/core/theme/color_schemes/dark/dark.dart';
import 'package:chat_app/core/theme/text_themes/text.theme.dart';
import 'package:flutter/material.dart';

final darkInputDecorationTheme = InputDecorationThemeData(
  filled: true,
  fillColor: DarkConstants.neutral300,
  hintStyle: ChatAppTextTheme.dark.bodyMedium!
    .copyWith(color: DarkConstants.neutral800),
  contentPadding: EdgeInsets.symmetric(
    vertical: 20,
    horizontal: 20
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(32),
    borderSide: BorderSide(color: DarkConstants.neutral200)
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(32),
    borderSide: BorderSide(color: DarkConstants.neutral200)
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(32),
    borderSide: BorderSide(
      color: DarkConstants.neutral800,
      width: 2,
    )
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(32),
    borderSide: BorderSide(
      color: DarkConstants.error400,
      width: 2,
    )
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(32),
    borderSide: BorderSide(
      color: DarkConstants.error600,
      width: 2,
    )
  ),
);