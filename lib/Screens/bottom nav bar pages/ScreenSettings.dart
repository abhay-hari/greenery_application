import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:greenery/Screens/ScreenLogIn.dart';
import 'package:greenery/Widgets/Text.dart';
import 'package:greenery/Widgets/backbutton.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/ScreenSettingsModel.dart';

class ScreenSettings extends StatefulWidget {
  const ScreenSettings({super.key});

  @override
  State<ScreenSettings> createState() => _ScreenSettingsState();
}

class _ScreenSettingsState extends State<ScreenSettings> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              backButton(function: () {}),
              SizedBox(
                width: 100,
              ),
              text(
                  text: "Profile",
                  FontWeight: FontWeight.w500,
                  fontFamily: "Poppins-Regular.ttf",
                  fontsize: 18,
                  color: 0xFF212F21)
            ],
          ),
          Container(
            height: 95,
            width: 95,
            child: CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
          ),
          text(
              text: "${user.displayName}",
              align: TextAlign.center,
              FontWeight: FontWeight.w500,
              fontFamily: "Poppins-Regular.ttf",
              fontsize: 16,
              color: 0xFF212F21),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal:
                    MediaQuery.of(context).size.width / 3 - user.email!.length),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: text(
                      text: "${user.email}",
                      align: TextAlign.center,
                      FontWeight: FontWeight.w400,
                      fontFamily: "Poppins-Regular.ttf",
                      fontsize: 16,
                      color: 0xFF212F21),
                ),
                IconButton(
                    onPressed: () {},
                    icon: user.email == null
                        ? Icon(
                            Icons.border_color,
                            size: 20,
                            color: Color(0xFF212F21),
                          )
                        : Icon(
                            Icons.verified,
                            size: 30,
                            color: Colors.green,
                          ))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: ListOfOptions.length,
            itemBuilder: (BuildContext, index) {
              return GestureDetector(
                onTap: () {
                  if (index == 4) {
                    showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                              title: text(
                                  text: "Log out",
                                  FontWeight: FontWeight.w500,
                                  fontFamily: "Poppins-Regular.ttf",
                                  fontsize: 18,
                                  color: 0xFF212F21),
                              // title: Text("Log out"),
                              content: text(
                                  text: "Log out of your account",
                                  FontWeight: FontWeight.w400,
                                  fontFamily: "Poppins-Regular.ttf",
                                  fontsize: 14,
                                  color: 0xFF212F21),
                              actions: [
                                TextButton(
                                  onPressed: () async {
                                    await SignOut(context);
                                  },
                                  child: text(
                                      text: "Log out",
                                      FontWeight: FontWeight.w400,
                                      fontFamily: "Poppins-Regular.ttf",
                                      fontsize: 14,
                                      color: 0xFF212F21),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(ctx).pop();
                                    },
                                    child: text(
                                        text: "No",
                                        FontWeight: FontWeight.w400,
                                        fontFamily: "Poppins-Regular.ttf",
                                        fontsize: 14,
                                        color: 0xFF212F21))
                              ],
                            ));
                  }
                },
                child: ListTile(
                  leading: Icon(
                    ListOfOptions[index].icon,
                    color: Color(
                      0xFF212F21,
                    ),
                    size: 24,
                  ),
                  title: text(
                      text: ListOfOptions[index].options,
                      FontWeight: FontWeight.w400,
                      fontFamily: "Poppins-Regular.ttf",
                      fontsize: 14,
                      color: 0xFF212F21),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 20,
              );
            },
          )
        ],
      ),
    );
  }

  SignOut(BuildContext ctx) async {
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => ScreenLogIn()), (route) => false);
    final sharedpref = await SharedPreferences.getInstance();
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await sharedpref.clear();
  }
}
