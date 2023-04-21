import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:greenery/Screens/ScreenHome.dart';
import 'package:greenery/Screens/ScreenRegister.dart';
import 'package:greenery/Widgets/Text.dart';
import 'package:greenery/Widgets/TextFormField.dart';
import 'package:greenery/Widgets/textbutton.dart';

import '../Widgets/Password textfield.dart';

class ScreenLogIn extends StatefulWidget {
  const ScreenLogIn({super.key});

  @override
  State<ScreenLogIn> createState() => _ScreenLogInState();
}

class _ScreenLogInState extends State<ScreenLogIn> {
  Future<void> signInwithGoogle() async {
    // create instance
    FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    // Triger the aauthentication flow
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    // obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    // create a new credentials
    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    // sign in the user with credentials
    final UserCredential userCredential =
        await auth.signInWithCredential(credential);
  }

  late String _password;
  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();

  final _formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  height: 330,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Positioned(
                          top: 51,
                          left: 114,
                          child: SizedBox(
                            width: 163,
                            height: 54,
                            child: Image.asset(
                              "assets/images/Logo/greenery.png",
                            ),
                          )),
                      Positioned(
                          right: 5,
                          left: 5,
                          top: 95,
                          child: SizedBox(
                              height: 260,
                              width: 380,
                              child: Image.asset(
                                "assets/images/Others/houseplants.png",
                                fit: BoxFit.fill,
                              ))),
                      Positioned(
                          right: 5,
                          top: 0,
                          child: Image.asset(
                              "assets/images/SplashScreen/case.png"))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 30, bottom: 2, left: 133, right: 133),
                child: text(
                    text: "Welcome back ",
                    FontWeight: FontWeight.w600,
                    fontFamily: "Poppins-Bold.ttf",
                    fontsize: 18,
                    color: 0xFF000000),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 31,
                  left: 138,
                ),
                child: text(
                    text: "Login to your account",
                    FontWeight: FontWeight.w400,
                    fontFamily: "Poppins-Medium.ttf",
                    fontsize: 12,
                    color: 0xFF000000),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Textfield(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your name";
                      } else {
                        return null;
                      }
                    },
                    hintText: "Full name",
                    icon: Icons.person,
                    iconsize: 16,
                    controller: fullNameController,
                    iconColor: 0xFF000000),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: PasswordField(
                  prefixIcon: Icons.lock,
                  iconSize: 19,
                  iconColor: 0xFF000000,
                  controller: passwordController,
                  fieldKey: _passwordFieldKey,
                  onFieldSubmitted: (String value) {
                    setState(() {
                      _password = value;
                    });
                  },
                  hintText: "password",
                  onSaved: (String? newValue) {},
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please type password";
                    } else {
                      return null;
                    }
                  },
                ),

                //   Textfield(

                //       validator: (value) {
                //         if (value == null || value.isEmpty) {
                //           return "Please enter your password";
                //         } else {
                //           return null;
                //         }
                //       },
                //       hintText: "Password",
                //       icon: Icons.lock,
                //       iconsize: 19,
                //       controller: fullNameController,
                //       iconColor: 0xFF000000),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28, left: 224),
                child: textButton(
                    function: () {},
                    text: "Forgot password ?",
                    FontWeight: FontWeight.w400,
                    fontFamily: "Poppins-Regular.ttf",
                    fontsize: 12,
                    color: 0xFF000000),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 14, left: 110, right: 110),
                child: SizedBox(
                  height: 45,
                  width: 170,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ScreenHome(),
                            ),
                          );
                        }
                      },
                      child: text(
                          text: "LOGIN",
                          FontWeight: FontWeight.w500,
                          fontFamily: "Poppins-Regular.ttf",
                          fontsize: 14,
                          color: 0xFFFFFFFF)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        width: 104,
                        child: Image.asset("assets/images/Others/line.png")),
                    text(
                        text: "OR",
                        FontWeight: FontWeight.w500,
                        fontFamily: "Poppins-SemiBold.ttf",
                        fontsize: 18,
                        color: 0xFF000000),
                    SizedBox(
                        width: 104,
                        child: Image.asset("assets/images/Others/line.png")),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      await signInwithGoogle();
                      if (mounted) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ScreenHome(),
                          ),
                        );
                      }
                    },
                    child: SizedBox(
                        height: 40,
                        width: 40,
                        child: Image.asset("assets/images/Logo/google.png")),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                        height: 40,
                        width: 40,
                        child: Image.asset("assets/images/Logo/facebook.png")),
                  ),
                ],
              ),
              textButton(
                  function: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ScreenRegister(),
                      ),
                    );
                  },
                  text: "Don’t have a account ?sign up ",
                  FontWeight: FontWeight.w400,
                  fontFamily: "Poppins-Regular.ttf",
                  fontsize: 12,
                  color: 0xFF434242)
            ],
          ),
        ),
      ),
    );
  }
}
