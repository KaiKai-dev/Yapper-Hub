import 'package:flutter/material.dart';

final filledButtonLight = FilledButton.styleFrom(
  backgroundColor: Color(0xFF5664F5),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(32)
  ),
  padding: EdgeInsets.symmetric(
    vertical: 16
  ),
  textStyle: TextStyle(
    color: Colors.white
  )
);

final filledButtonDark = FilledButton.styleFrom(
  backgroundColor: const Color(0xFF5664F5),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(32)
  ),
  padding: EdgeInsets.symmetric(
    vertical: 16
  ),
  textStyle: TextStyle(
    color: Colors.white
  )
);