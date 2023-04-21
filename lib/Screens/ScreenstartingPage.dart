import 'package:flutter/material.dart';
import 'package:greenery/Widgets/textbutton.dart';

import '../Widgets/Text.dart';
import 'ScreenLogIn.dart';

class StartingPage extends StatefulWidget {
  const StartingPage({super.key});

  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
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
                    child: Container(
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
                Positioned(
                  right: 76,
                  bottom: 205,
                  child: Container(
                    height: 45,
                    width: 237,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Color(0xFFFFFFFF),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ScreenLogIn(),
                          ),
                        );
                      },
                      child: text(
                          text: "sign in",
                          FontWeight: FontWeight.w400,
                          fontFamily: "Poppins-Medium.ttf",
                          fontsize: 14,
                          color: 0xFF736464),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
                Positioned(
                  right: 110,
                  bottom: 154,
                  child: textButton(
                      function: () {},
                      text: "Create an account",
                      FontWeight: FontWeight.w400,
                      fontFamily: "Poppins",
                      fontsize: 18,
                      color: 0xFFFFFFFF),
                  //   child: text(
                  //       text: "Create an account ",
                  //       FontWeight: FontWeight.w400,
                  //       fontFamily: "Poppins",
                  //       fontsize: 18,
                  //       color: 0xFFFFFFFF),
                  // )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
