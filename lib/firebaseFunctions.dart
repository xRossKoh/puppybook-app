//FIREBASE FUNCTIONS IF NEEDED

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
//
// import 'package:puppybook_app/constants.dart';
// import 'package:puppybook_app/main.dart';
// import 'package:puppybook_app/models/PupOwner.dart';
// import 'package:firebase_storage/firebase_storage.dart';
//
// class FirebaseFunctions {
//   final _auth = FirebaseAuth.instance;
//   CollectionReference userCollection =
//       FirebaseFirestore.instance.collection(Constants.USERS);
//
//   Reference _imagesRef = FirebaseStorage.instance.ref();
//   void getCurrentUserCred() async {
//     try {
//       final userCred = await _auth.currentUser;
//       if (userCred != null) {
//         // loggedInUser = user;
//       }
//     } catch (e) {}
//   }
//
//   Future<void> addUser(PupOwner owner, String uid) async {
//     String id;
//     await userCollection.doc(uid).set({
//       'email': owner.email,
//       'name': owner.pupName,
//       'age': owner.pupAge,
//       'faveFood': owner.pupFood,
//       'imgPath': owner.imgPath,
//     }).then((value) {
//       print("User added");
//     }).catchError((error) => print("Failed to add user: $error"));
//   }
//
//   Future<PupOwner> getPupOwner(String userId) async {
//     PupOwner returnVal;
//     await userCollection.doc(userId).get().then((doc) {
//       PupOwner owner = new PupOwner(
//           email: doc['email'],
//           pupName: doc['name'],
//           pupAge: doc['age'],
//           pupFood: doc['faveFood'],
//           imgPath: doc['imgPath']);
//       returnVal = owner;
//     }).catchError((error) => print(error));
//     return returnVal;
//   }
//
//   Future<void> getOtherDogs() async {
//     await for (var snapshot in userCollection.snapshots()) {
//       //Loop through snapshots
//       for (var user in snapshot.docs) {
//         print(user.data());
//       }
//     }
//     ; //Like a list of Future<Objects> that we are subscribing to
//
//     //   final otherUsers = await userCollection.get();
//     //   for (var snapshot in otherUsers.docs) {
//     //     print(snapshot.data);
//     //   }
//   }
//
//   Stream<QuerySnapshot<Object>> getStream() {
//     var snapshots = userCollection.snapshots();
//     print("From firebase snapshots: " + snapshots.toString());
//     return snapshots;
//   }
//
//   Future<String> getImageUrlFromStorage(String fileName) async {
//     var url = await _imagesRef.child(fileName).getDownloadURL();
//     print("Image url is: $url");
//     return url;
//   }
// }
