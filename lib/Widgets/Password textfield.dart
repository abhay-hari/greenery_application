import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    required this.prefixIcon,
    required this.iconColor,
    required this.iconSize,
    required this.fieldKey,
    required this.hintText,
    required this.onSaved,
    required this.validator,
    required this.onFieldSubmitted,
    required this.controller,
  });
  final int iconColor;
  final double iconSize;
  final IconData prefixIcon;
  final TextEditingController controller;
  final Key fieldKey;
  final String hintText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;

  @override
  _PasswordFieldState createState() => new _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      key: widget.fieldKey,
      obscureText: _obscureText,
      maxLength: 8,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        prefixIcon: Icon(
          widget.prefixIcon,
          size: widget.iconSize,
          color: Color(widget.iconColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        hintText: widget.hintText,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child:
              new Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
        ),
      ),
    );
  }
}
