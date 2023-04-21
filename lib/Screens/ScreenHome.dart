import 'package:flutter/material.dart';
import 'package:greenery/Screens/bottom%20nav%20bar%20pages/ScreenAddToCart.dart';
import 'package:greenery/Screens/bottom%20nav%20bar%20pages/ScreenHome4.dart';
import 'package:greenery/Screens/bottom%20nav%20bar%20pages/ScreenNotification.dart';
import 'package:greenery/Screens/bottom%20nav%20bar%20pages/ScreenSettings.dart';

import '../Widgets/Bottom  Navigation Bar.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  int selectIndex = 0;
  final bottomNavPages = [
    ScreenHome4(),
    ScreenNotification(),
    ScreenSettings(),
    ScreenAddToCart()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: bottomNavPages[selectIndex],

        // bottomNavigationBar: BottomNavBar(selectindex: selectIndex),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Color(0xFF195618),
          backgroundColor: Color(0xFFF6FFF7),
          currentIndex: selectIndex,
          onTap: _onItemTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                label: "",
                icon: Icon(
                  Icons.home,
                  size: 25,
                  color: Color(0xFF212F21),
                )),
            BottomNavigationBarItem(
                label: "",
                icon: Icon(
                  Icons.notifications,
                  size: 25,
                  color: Color(0xFF212F21),
                )),
            BottomNavigationBarItem(
                label: "",
                icon: Icon(
                  Icons.account_circle_rounded,
                  size: 25,
                  color: Color(0xFF212F21),
                )),
            BottomNavigationBarItem(
                label: "",
                icon: Icon(
                  Icons.shopping_cart,
                  size: 25,
                  color: Color(0xFF212F21),
                ))
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      selectIndex = index;
    });
  }
}
