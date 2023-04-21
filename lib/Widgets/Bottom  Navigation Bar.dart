import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({required this.selectindex});

  late int selectindex;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Color(0xFF195618),
      backgroundColor: Color(0xFFF6FFF7),
      currentIndex: widget.selectindex,
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
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      widget.selectindex = index;
    });
  }
}
