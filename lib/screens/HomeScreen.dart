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
              Icons.person,
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
            Container(
              child: Text(
                "Your PupFeed",
                style: TextStyle(color: Constants.GOLD, fontSize: 40),
              ),
            ),
            Container(
              height: 600,
              child: StreamBuilder(
                //TODO: NEED TO REPLACE FIREBASE STREAM WITH A STATIC LIST OF CONTENT
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
                      Widget card = FeedCardWidget(
                          imgPath: imgPath, name: name, food: food, age: age);
                      feedWidgets.add(card);
                      print(feedWidgets);
                    }
                    return ListView(
                      children: feedWidgets,
                    );
                  } else {
                    return Container(child: Text("No Data Yet!"));
                  }
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        child: Text("Test a function"),
        onPressed: () {
          Navigator.pushNamed(context, ProfileScreenStateful.id);
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 30),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  imgPath,
                  height: 120,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Call me:  ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Wub to eat:   ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "I am a big: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name),
                      Text(food),
                      Text("$age years old!"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
