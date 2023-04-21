import 'package:flutter/material.dart';

class SettingsDetail {
  late IconData icon;
  late String options;
  SettingsDetail({required this.icon, required this.options});
}

List<SettingsDetail> ListOfOptions = [
  SettingsDetail(icon: Icons.info, options: "About"),
  SettingsDetail(icon: Icons.shopping_cart, options: "My orders"),
  SettingsDetail(icon: Icons.account_box, options: "Address"),
  SettingsDetail(icon: Icons.menu_book, options: "Terms and conditions"),
  SettingsDetail(icon: Icons.arrow_circle_left, options: "Sign out"),
];


// class SettingsDetail {
// late IconData iconData;
// late String option;

// SettingsDetail({required this.iconData,required this.option,});
// }