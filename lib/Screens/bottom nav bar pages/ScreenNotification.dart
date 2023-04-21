import 'package:flutter/material.dart';

class ScreenNotification extends StatefulWidget {
  const ScreenNotification({super.key});

  @override
  State<ScreenNotification> createState() => _ScreenNotificationState();
}

class _ScreenNotificationState extends State<ScreenNotification> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(child: Text("notification")),
    );
  }
}
