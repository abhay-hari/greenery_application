import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Color/Primary Color.dart';
import 'Screens/SplashScreen.dart';
import 'firebase_options.dart';

const SAVE_KEY_NAME = 'UserLoggedIn';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: primary,
      ),
      home: SplashScreen(),
    );
  }
}
