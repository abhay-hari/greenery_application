import 'package:flutter/material.dart';

const MaterialColor primary = MaterialColor(_primaryPrimaryValue, <int, Color>{
  50: Color(0xFFE3EBE3),
  100: Color(0xFFBACCBA),
  200: Color(0xFF8CAB8C),
  300: Color(0xFF5E895D),
  400: Color(0xFF3C6F3B),
  500: Color(_primaryPrimaryValue),
  600: Color(0xFF164F15),
  700: Color(0xFF124511),
  800: Color(0xFF0E3C0E),
  900: Color(0xFF082B08),
});
const int _primaryPrimaryValue = 0xFF195618;

const MaterialColor primaryAccent =
    MaterialColor(_primaryAccentValue, <int, Color>{
  100: Color(0xFF67FF67),
  200: Color(_primaryAccentValue),
  400: Color(0xFF01FF01),
  700: Color(0xFF00E600),
});
const int _primaryAccentValue = 0xFF34FF34;
