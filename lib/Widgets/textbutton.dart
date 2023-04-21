import 'package:flutter/material.dart';

Widget textButton(
    {required Function() function,
    required String text,
    required FontWeight,
    required String fontFamily,
    required double fontsize,
    required int color}) {
  return TextButton(
      onPressed: function,
      child: Text(
        text,
        style: TextStyle(
            fontFamily: fontFamily,
            fontSize: fontsize,
            fontWeight: FontWeight,
            color: Color(color)),
      ));
}
