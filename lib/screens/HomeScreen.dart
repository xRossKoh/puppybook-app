import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:puppybook_app/constants.dart';
import 'package:puppybook_app/screens/ProfileScreenStateful.dart';
import 'package:puppybook_app/components/FeedCardWidget.dart';

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
              child: ListView.builder(
                itemCount: Constants.FEED_INFO.length,
                itemBuilder: (BuildContext context, int index) {
                  var len = (Constants.FEED_INFO.length);
                  String name = Constants.FEED_INFO[index]['name'] ?? " ";
                  int age = Constants.FEED_INFO[index]['age'] ?? 0;
                  String food = Constants.FEED_INFO[index]['faveFood'];
                  String imgPath = '';
                  if (Constants.FEED_INFO[index]['imgPath'] == null) {
                    imgPath =
                        'https://firebasestorage.googleapis.com/v0/b/flutterworkshop-41682.appspot.com/o/feedDog.jpeg?alt=media&token=13268b09-10e2-44d7-918a-41aca0666b76';
                  } else {
                    imgPath = Constants.FEED_INFO[index]['imgPath'];
                  }
                  return FeedCardWidget(
                      imgPath: imgPath, name: name, food: food, age: age);
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
