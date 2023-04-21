import 'package:flutter/material.dart';
import 'package:greenery/Screens/ScreenLogIn.dart';
import 'package:greenery/Widgets/Text.dart';
import 'package:greenery/Widgets/textbutton.dart';

import '../Widgets/Password textfield.dart';
import '../Widgets/TextFormField.dart';
import '../Widgets/backbutton.dart';

class ScreenRegister extends StatefulWidget {
  const ScreenRegister({super.key});

  @override
  State<ScreenRegister> createState() => _ScreenRegisterState();
}

class _ScreenRegisterState extends State<ScreenRegister> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  late String _password;
  late String _passwords;

  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();
  final _confirmPasswordFieldKey = GlobalKey<FormFieldState<String>>();

  @override
  void initState() {
    var _passwordVisible = false;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                backButton(function: () {
                  Navigator.pop(context);
                }),
                SizedBox(
                  height: 180,
                  width: 240,
                  // color: Colors.amber,
                  child: Stack(children: [
                    Positioned(
                      right: 76,
                      top: 27,
                      child: SizedBox(
                          height: 54,
                          width: 163,
                          child:
                              Image.asset("assets/images/Logo/greenery.png")),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: SizedBox(
                          height: 180,
                          width: 76,
                          child: Image.asset(
                            "assets/images/SplashScreen/case.png",
                            fit: BoxFit.fill,
                          )),
                    ),
                    Positioned(
                      top: 130,
                      right: 136,
                      child: SizedBox(
                        height: 27,
                        width: 76,
                        child: text(
                            text: "Register",
                            FontWeight: FontWeight.w600,
                            fontFamily: "Poppins-Regular.ttf",
                            fontsize: 18,
                            color: 0xFF000000),
                      ),
                    ),
                    Positioned(
                      right: 91,
                      top: 160,
                      child: SizedBox(
                        height: 18,
                        width: 136,
                        child: text(
                            text: "create  a new account",
                            FontWeight: FontWeight.w400,
                            fontFamily: "Poppins-Regular.ttf",
                            fontsize: 12,
                            color: 0xFF050505),
                      ),
                    )
                  ]),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: text(
                  text: "NAME",
                  FontWeight: FontWeight.w400,
                  fontFamily: "Poppins-Regular.ttf",
                  fontsize: 14,
                  color: 0xFF050505),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Textfield(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your name";
                    } else {
                      return null;
                    }
                  },
                  hintText: "",
                  icon: Icons.person,
                  iconsize: 16,
                  iconColor: 0xFF000000,
                  controller: nameController),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 17),
              child: text(
                  text: "EMAIL",
                  FontWeight: FontWeight.w400,
                  fontFamily: "Poppins-Regular.ttf",
                  fontsize: 14,
                  color: 0xFF050505),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Textfield(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
                    } else {
                      return null;
                    }
                  },
                  hintText: "",
                  icon: Icons.email,
                  iconsize: 16,
                  iconColor: 0xFF000000,
                  controller: emailController),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 12),
              child: text(
                  text: "PHONE",
                  FontWeight: FontWeight.w400,
                  fontFamily: "Poppins-Regular.ttf",
                  fontsize: 14,
                  color: 0xFF050505),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Textfield(
                  length: 10,
                  input: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length != 10) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: text(
                            text: "Please check your number",
                            FontWeight: FontWeight.w400,
                            fontFamily: "Poppins-Regular.ttf",
                            fontsize: 14,
                            color: 0xFFFFFFFF),
                      ));
                      // return "Please check your number";
                    } else {
                      return null;
                    }
                  },
                  hintText: "",
                  icon: Icons.send_to_mobile,
                  iconsize: 16,
                  iconColor: 0xFF000000,
                  controller: phoneController),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 30),
              child: text(
                  text: "PASSWORD",
                  FontWeight: FontWeight.w400,
                  fontFamily: "Poppins-Regular.ttf",
                  fontsize: 14,
                  color: 0xFF050505),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: PasswordField(
                  iconColor: 0xFF000000,
                  prefixIcon: Icons.lock,
                  iconSize: 19,
                  controller: passwordController,
                  fieldKey: _passwordFieldKey,
                  hintText: "",
                  onFieldSubmitted: (String password) {
                    _passwords = password;
                  },
                  onSaved: (String? newPassword) {},
                  validator: (password) {
                    if (password!.isEmpty ||
                        passwordController.text !=
                            confirmPasswordController.text) {
                      return "password is incorrect";
                    } else {
                      return null;
                    }
                  },
                )),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 10),
              child: text(
                  text: "CONFIRM PASSWORD",
                  FontWeight: FontWeight.w400,
                  fontFamily: "Poppins-Regular.ttf",
                  fontsize: 14,
                  color: 0xFF050505),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: PasswordField(
                prefixIcon: Icons.lock,
                iconSize: 19,
                iconColor: 0xFF000000,
                controller: confirmPasswordController,
                fieldKey: _confirmPasswordFieldKey,
                onFieldSubmitted: (String value) {
                  setState(() {
                    _password = value;
                  });
                },
                hintText: '',
                onSaved: (String? newValue) {},
                validator: (value) {
                  if (value!.isEmpty ||
                      passwordController.text !=
                          confirmPasswordController.text) {
                    return "password is incorrect";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 117, vertical: 47),
              child: SizedBox(
                height: 45,
                width: 156,
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ScreenLogIn(),
                          ),
                        );
                      }
                    },
                    child: text(
                        text: "REGISTER",
                        FontWeight: FontWeight.w400,
                        fontFamily: "Poppins-Regular.ttf",
                        fontsize: 14,
                        color: 0xFFFFFFFF)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 95),
              child: textButton(
                  function: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ScreenLogIn(),
                      ),
                    );
                  },
                  text: "Already have a account?Login",
                  FontWeight: FontWeight.w400,
                  fontFamily: "Poppins-Regular.ttf",
                  fontsize: 12,
                  color: 0xFF070707),
            )
          ],
        ),
      ),
    );
  }
}
