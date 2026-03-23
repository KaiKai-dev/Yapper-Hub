import 'dart:ui';

import 'package:flutter/material.dart';

TextStyle hyperlinkStyle(BuildContext context) => TextStyle(
  color: Theme.of(context).colorScheme.primary,
  fontWeight: FontWeight.bold,
  decoration: .underline,
  decorationColor: Theme.of(context).colorScheme.primary,
);