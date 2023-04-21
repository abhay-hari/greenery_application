import 'package:flutter/material.dart';

Widget backButton({
  required Function() function,
}) {
  return IconButton(
      onPressed: function,
      icon: Icon(
        Icons.arrow_back,
        size: 21,
        color: Color(0xFF000000),
      ));
}
