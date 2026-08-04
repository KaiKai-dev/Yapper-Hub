import 'package:chat_app/core/theme/color_schemes/light/light.dart';
import 'package:chat_app/core/theme/text_themes/text.theme.dart';
import 'package:flutter/material.dart';

final lightDecorationtheme = InputDecorationThemeData(
  filled: true,
  fillColor: LightConstants.neutral50,
  hintStyle: ChatAppTextTheme.light.bodyMedium!
    .apply(color: LightConstants.neutral400),
  contentPadding: EdgeInsets.symmetric(
    vertical: 20,
    horizontal: 20
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(32),
    borderSide: BorderSide(color: LightConstants.neutral400)
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(32),
    borderSide: BorderSide(color: LightConstants.neutral200)
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(32),
    borderSide: BorderSide(
      color: LightConstants.neutral300,
      width: 2,
    )
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(32),
    borderSide: BorderSide(
      color: LightConstants.error600,
      
    )
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(32),
    borderSide: BorderSide(
      color: LightConstants.error600,
    )
  ),
  errorStyle: ChatAppTextTheme.light.labelMedium!
    .copyWith(color: LightConstants.error600),
);