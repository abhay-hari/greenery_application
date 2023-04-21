import 'dart:async';

import 'package:flutter/material.dart';
import 'package:greenery/Screens/ScreenHome.dart';
import 'package:greenery/Widgets/Text.dart';
import 'package:greenery/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ScreenstartingPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const StartingPage(),
        ),
      );
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.white,
              ),
              Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.white,
                child: Image.asset(
                  "assets/images/SplashScreen/Green.png",
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                  right: 30,
                  top: 40,
                  child: SizedBox(
                    height: 150,
                    width: 64,
                    child: Image.asset(
                      "assets/images/SplashScreen/case.png",
                      fit: BoxFit.cover,
                    ),
                  )),
              Positioned(
                left: 47,
                top: 165,
                child: SizedBox(
                  height: 88,
                  width: 287,
                  child: Image.asset("assets/images/Logo/greenery.png"),
                ),
              ),
              Positioned(
                top: 480,
                right: 154,
                child: text(
                    text: "Let’s plant with us",
                    FontWeight: FontWeight.w400,
                    fontFamily: "Inter-Medium.ttf",
                    fontsize: 16,
                    color: 0xFFFFFFFF),
              ),
              Positioned(
                right: 101,
                top: 501,
                child: text(
                    text: "make a nature home",
                    FontWeight: FontWeight.w400,
                    fontFamily: "Inter-Medium.ttf",
                    fontsize: 16,
                    color: 0xFFFFFFFF),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> checkUserLoggedIn() async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    final _userLoggedIn = _sharedPrefs.getBool(SAVE_KEY_NAME);
    if (_userLoggedIn == null || _userLoggedIn == false) {
      Timer(Duration(seconds: 5), () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const StartingPage(),
          ),
        );
      });
      // Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (context) => const StartingPage(),
      //   ),
      // );
    } else {
      Timer(Duration(seconds: 5), () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ScreenHome(),
          ),
        );
      });
    }
  }
}
