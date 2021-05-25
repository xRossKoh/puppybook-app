import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:puppybook_app/main.dart';
import 'package:puppybook_app/models/PupOwner.dart';

import '../constants.dart';
import '../firebaseFunctions.dart';

class ProfileScreenStateful extends StatefulWidget {
  const ProfileScreenStateful({Key key}) : super(key: key);
  static const String id = "/profile_screen_stateful";

  @override
  _ProfileScreenStatefulState createState() => _ProfileScreenStatefulState();
}

class _ProfileScreenStatefulState extends State<ProfileScreenStateful> {
  String screenTitle = "About My Best Bud Ever!";
  PupOwner owner = MyApp.pupOwner;
  @override
  void initState() {
    // TODO: implement initState
    owner = MyApp.pupOwner;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenTitle = "I am changing a state!";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.GOLD,
        // actions: [IconButton(icon: ,)],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'About My Best Bud Ever! ',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Constants.GOLD),
                ),
                SizedBox(
                  height: 20,
                ),
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('images/charlie_3.jpg'),
                  //TODO: Change to user.imgPath
                ),
                SizedBox(
                  height: 20,
                  width: 100,
                  child: Divider(
                    color: Constants.GOLD,
                    thickness: 1,
                  ),
                ),
                Card(
                  //USING CARD PROPERTIES
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.tag_faces_outlined,
                      color: Colors.brown,
                    ),
                    title: Text(MyApp.pupOwner.pupName),
                    trailing: IconButton(
                      icon: Icon(Icons.edit, color: Colors.grey),
                      onPressed: () {},
                    ),
                  ),
                ),
                Card(
                  //USING CARD PROPERTIES
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.fastfood,
                      color: Colors.brown,
                    ),
                    title: Row(
                      children: [
                        Text(
                          "Fave Treat: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(MyApp.pupOwner.pupFood),
                      ],
                    ),
                  ),
                ),
                Card(
                  //USING CARD PROPERTIES
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.cake,
                      color: Colors.brown,
                    ),
                    title: Row(
                      children: [
                        Text(MyApp.pupOwner.pupAge.toString()),
                        Text(
                          "  years old",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
