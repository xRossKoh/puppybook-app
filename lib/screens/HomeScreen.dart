import 'dart:io';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:puppybook_app/constants.dart';
import 'package:puppybook_app/firebaseFunctions.dart';
import 'package:puppybook_app/screens/ProfileScreen.dart';
import 'package:puppybook_app/screens/ProfileScreenStateful.dart';
import 'package:puppybook_app/screens/RegistrationScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  static const String id = "/";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PuppyBook"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.person_add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, ProfileScreenStateful.id);
            },
          )
        ],
        backgroundColor: Constants.GOLD, //CENTER THIS
      ),
      //TODO: ADD BACKGROUND COLOUR
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: FirebaseFunctions().getStream(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var otherUsers = snapshot.data.docs;
                  var len = (otherUsers.length);
                  print("oTher users length: $len");
                  List<Widget> feedWidgets = [];
                  for (var otherUser in otherUsers) {
                    String name = otherUser['name'] ?? " ";
                    int age = otherUser['age'] ?? 0;
                    String food = otherUser['faveFood'];
                    String imgPath = '';
                    if (otherUser['imgPath'] == null) {
                      // FirebaseFunctions()
                      //     .getImageUrlFromStorage('feedDog.jpeg')
                      //     .then((value) {
                      //   setState(() {
                      //     imgPath = value;
                      //   });
                      // }).whenComplete(() {});
                      imgPath =
                          'https://firebasestorage.googleapis.com/v0/b/flutterworkshop-41682.appspot.com/o/feedDog.jpeg?alt=media&token=13268b09-10e2-44d7-918a-41aca0666b76';
                    } else {
                      imgPath = otherUser['imgPath'];
                    }
                    // ignore: missing_return
                    Widget card = Padding(
                        padding: EdgeInsets.all(10),
                        child: FeedCardWidget(
                            imgPath: imgPath,
                            name: name,
                            food: food,
                            age: age));
                    feedWidgets.add(card);
                    print(feedWidgets);
                  }
                  return Expanded(
                    child: ListView(
                      children: feedWidgets,
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        child: Text("Test a function"),
        onPressed: () {
          FirebaseFunctions().getOtherDogs();
        },
      ),
    );
  }
}

class FeedCardWidget extends StatelessWidget {
  const FeedCardWidget({
    Key key,
    @required this.imgPath,
    @required this.name,
    @required this.food,
    @required this.age,
  }) : super(key: key);

  final String imgPath;
  final String name;
  final String food;
  final int age;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.network(
                imgPath,
              ),
            ),
            Text(
              "Hi! I am $name",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("I wub to eat $food"),
            Text("I am a big $age years old!"),
          ],
        ),
      ),
    );
  }
}
