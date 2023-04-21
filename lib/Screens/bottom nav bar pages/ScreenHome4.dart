import 'package:flutter/material.dart';

class ScreenHome4 extends StatefulWidget {
  const ScreenHome4({super.key});

  @override
  State<ScreenHome4> createState() => _ScreenHome4State();
}

class _ScreenHome4State extends State<ScreenHome4> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(child: Text("Home")),
    );
  }
}
