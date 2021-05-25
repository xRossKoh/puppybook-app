import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:puppybook_app/screens/HomeScreen.dart';
import 'package:puppybook_app/screens/ProfileScreen.dart';
import 'package:puppybook_app/screens/ProfileScreenStateful.dart';
import 'package:puppybook_app/screens/RegistrationScreen.dart';

import 'models/PupOwner.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // static User user = User(
  //     email: '',
  //     pupName: 'Charlie',
  //     pupAge: 12,
  //     pupFood: "Smelly socks I find on floor!!",
  //     imgPath: 'images/charlie_3.jpeg');
  static PupOwner pupOwner;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: ProfileScreenStateful(),
      initialRoute: RegistrationScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        ProfileScreen.id: (context) => ProfileScreen(),
        ProfileScreenStateful.id: (context) => ProfileScreenStateful(),
        RegistrationScreen.id: (context) => RegistrationScreen()
      },
    );
  }
}
