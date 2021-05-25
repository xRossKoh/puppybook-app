import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:puppybook_app/main.dart';
import 'package:puppybook_app/models/PupOwner.dart';

import '../constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);
  static const String id = "/profile_screen_stateless";

  // User user = MyApp.user; //TODO: Try this

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "About My Best Bud Ever!",
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
                  //   NetworkImage(
                  //       'https://www.rd.com/wp-content/uploads/2019/01/shutterstock_673465372.jpg?resize=768,512'),
                  // ), //TODO: Add asset image here
                ),
                SizedBox(
                  height: 20,
                  width: 100,
                  child: Divider(
                    color: Constants.GOLD,
                    thickness: 1,
                  ),
                ),
                Container(
                  //USING A CONTAINER
                  color: Constants.ROSEGOLD,
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.tag_faces_outlined, color: Colors.brown),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Name: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Charlie A"),
                    ],
                  ),
                ),
                Card(
                  //USING A CARD WITH ROWS
                  //TODO: Add elevation
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.fastfood, color: Colors.brown),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Love to gobble: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("Socks!"),
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
                      title: Text("12"),
                      trailing: Text(
                        "years old",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
