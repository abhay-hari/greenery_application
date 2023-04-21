import 'package:flutter/material.dart';

Widget Textfield({
  // required Function(value) {valiDator},
  int? length,
  TextInputType? input,
  IconData? suffixicon,
  required String hintText,
  required IconData icon,
  required double iconsize,
  required int iconColor,
  required TextEditingController controller,
  required FormFieldValidator<String> validator,
}) {
  return TextFormField(
    maxLength: length,
    keyboardType: input,
    validator: validator,
    decoration: InputDecoration(
      hintText: hintText,
      suffixIcon: Icon(suffixicon),
      prefixIcon: Icon(
        icon,
        size: iconsize,
        color: Color(iconColor),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
