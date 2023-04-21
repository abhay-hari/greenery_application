import 'package:flutter/material.dart';

Widget text(
    {TextAlign? align,
    required String text,
    required FontWeight,
    required String fontFamily,
    required double fontsize,
    required int color}) {
  return Text(
    text,
    textAlign: align,
    style: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontsize,
        fontWeight: FontWeight,
        color: Color(color)),
  );
}
