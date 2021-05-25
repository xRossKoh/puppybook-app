import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:puppybook_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:puppybook_app/firebaseFunctions.dart';
import 'package:puppybook_app/main.dart';
import 'package:puppybook_app/screens/HomeScreen.dart';
import 'package:puppybook_app/models/PupOwner.dart';
import 'package:puppybook_app/screens/ProfileScreenStateful.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key key}) : super(key: key);
  static const String id = "registrationScreen";
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance; //methods for sign in, log in
  String email;
  String password;
  String pupName;
  String pupFood;
  int pupAge;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/puppybook_icon.jpeg'),
              ),
              SizedBox(
                height: 50,
                width: 150,
                child: Divider(
                  color: Constants.GOLD,
                  thickness: 1,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "Not A User Yet?",
                        style: TextStyle(
                            fontSize: 25,
                            color: Constants.GOLD,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 150,
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            email = value;
                          },
                          decoration:
                              InputDecoration(hintText: "Enter your email"),
                        ),
                      ),
                      Container(
                        width: 150,
                        child: TextField(
                          textAlign: TextAlign.center,
                          //Password must be > 6 char
                          onChanged: (value) {
                            pupName = value;
                          },
                          decoration:
                              InputDecoration(hintText: "Enter puppy's name"),
                        ),
                      ),
                      Container(
                        width: 150,
                        child: TextField(
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            pupFood = value;
                          },
                          decoration: InputDecoration(
                              hintText: "Enter their fave food"),
                        ),
                      ),
                      Container(
                        width: 150,
                        child: TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            pupAge = int.parse(value);
                          },
                          decoration: InputDecoration(hintText: "Enter age"),
                        ),
                      ),
                      Container(
                        width: 150,
                        child: TextField(
                          textAlign: TextAlign.center,
                          obscureText: true,
                          //Password must be > 6 char
                          onChanged: (value) {
                            password = value;
                          },
                          decoration:
                              InputDecoration(hintText: "Enter password"),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      FlatButton(
                          onPressed: () async {
                            print(email);
                            print(password);
                            try {
                              final newUser =
                                  await _auth.createUserWithEmailAndPassword(
                                      email: email, password: password);
                              //Add await and async to ensure user has been created and authenticated before
                              //calling other functions.
                              print('New user is:');
                              print(newUser);
                              if (newUser != null) {
                                //newUser is saved inside the _auth object.
                                print('here');
                                PupOwner owner = new PupOwner(
                                    email: email,
                                    pupName: pupName,
                                    pupAge: pupAge,
                                    pupFood: pupFood);
                                print(owner);

                                FirebaseFunctions()
                                    .addUser(owner, newUser.user.uid)
                                    .then((value) {
                                  setState(() {
                                    owner.id = newUser.user.uid;
                                    MyApp.pupOwner = owner;
                                  });

                                  print(MyApp.pupOwner.pupName);
                                });
                                print("here2");
                                Navigator.pushNamed(
                                    context, ProfileScreenStateful.id);
                              }
                            } catch (e) {
                              print("Exception while signing up: " + e);
                            }
                          },
                          color: Colors.black,
                          child: Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "OR",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 25,
                            color: Constants.GOLD,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 150,
                        child: TextField(
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            email = value;
                          },
                          decoration:
                              InputDecoration(hintText: "Enter your email"),
                        ),
                      ),
                      Container(
                        width: 150,
                        child: TextField(
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            password = value;
                          },
                          decoration:
                              InputDecoration(hintText: "Enter password"),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      FlatButton(
                          onPressed: () async {
                            print('Logging user in.');
                            try {
                              final user =
                                  await _auth.signInWithEmailAndPassword(
                                      email: email, password: password);
                              if (user != null) {
                                await FirebaseFunctions()
                                    .getPupOwner(user.user.uid)
                                    .then((owner) {
                                  setState(() {
                                    MyApp.pupOwner = owner;
                                  });
                                  Navigator.pushNamed(context, HomeScreen.id);
                                });
                              }
                            } catch (e) {
                              print(e);
                            }
                          },
                          color: Colors.black,
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
