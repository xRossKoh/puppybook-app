import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PuppyBook"), //CENTER THIS
      ),
      //TODO: ADD BACKGROUND COLOUR
      body: Image(
        image: AssetImage('images/MicrosoftTeams-image.png'),
      ),

      //   NetworkImage(
      //       'https://www.rd.com/wp-content/uploads/2019/01/shutterstock_673465372.jpg?resize=768,512'),
      // ), //TODO: Add asset image here
      floatingActionButton: RaisedButton(
        onPressed: () {},
      ),
    );
  }
}
