import 'dart:async';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sporthub/common/color_extension.dart';
import 'package:sporthub/service/firestore.dart';
import 'package:sporthub/view/workout/exercise/AbsExercisePage.dart';
import 'package:sporthub/view/workout/exercise/ArmExercisePage.dart';
import 'package:sporthub/view/workout/exercise/BackExercisePage.dart';
import 'package:sporthub/view/workout/exercise/LegExercisePage.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => homePageState();
}

class homePageState extends State<homePage> {
  final FirestoreService firestoreService = FirestoreService();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? firstname = "Loading...";
  String? lastname = "";
  String? profileImageURL;
  String randomWorkoutImage = 'assets/img/back.jpg';
  String randomWorkoutName = 'Back';

  Future<void> _addFieldToUserDocument(String fieldName, dynamic value) async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentReference userDocRef =
          _firestore.collection('users').doc(user.email);
      await userDocRef.update({
        fieldName: value,
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchUserData();
    _getRandomWorkout();
  }

  Future<void> _fetchUserData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentReference userDocRef =
          _firestore.collection('users').doc(user.email);
      DocumentSnapshot docSnapshot = await userDocRef.get();

      if (docSnapshot.exists) {
        Map<String, dynamic>? data =
            docSnapshot.data() as Map<String, dynamic>?;
        if (data != null) {
          setState(() {
            firstname = data['first name'];
            lastname = data['last name'];
            profileImageURL = data['imageLink'];
          });
        } else {
          print("No data found in document");
        }
      } else {
        print("Document does not exist");
      }
    } else {
      print("No user is currently signed in");
    }
  }

  void _getRandomWorkout() {
    final workouts = [
      {'name': 'Abs', 'image': 'assets/img/abs.jpg'},
      {'name': 'Arm', 'image': 'assets/img/arm.jpg'},
      {'name': 'Leg', 'image': 'assets/img/leg.jpg'},
      {'name': 'Back', 'image': 'assets/img/back.jpg'},
    ];

    final randomIndex = Random().nextInt(workouts.length);
    final selectedWorkout = workouts[randomIndex];

    setState(() {
      randomWorkoutName = selectedWorkout['name']!;
      randomWorkoutImage = selectedWorkout['image']!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size media = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 45, top: 0, right: 10),
                  child: Row(
                    children: [
                      ClipOval(
                        child: profileImageURL != null
                            ? Image.network(
                                profileImageURL!,
                                fit: BoxFit.cover,
                                width: 85.0,
                                height: 85.0,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    'assets/img/default profile.jpg',
                                    fit: BoxFit.cover,
                                    width: 85.0,
                                    height: 85.0,
                                  );
                                },
                              )
                            : Image.asset(
                                'assets/img/default profile.jpg',
                                fit: BoxFit.cover,
                                width: 85.0,
                                height: 85.0,
                              ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, bottom: 3),
                              child: Text(
                                "$firstname $lastname",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  fontFamily: 'Quicksand',
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, bottom: 0, right: 0, top: 0),
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Welcome Back!",
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: 'Quicksand',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 0,
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, right: 15, left: 45),
                  child: Text(
                    "Categories",
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 25,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                  items: [
                    Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AbsExercisePage()));
                            print("abs tapped");
                          },
                          child: Container(
                            margin: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              image: DecorationImage(
                                image: AssetImage('assets/img/abs.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  "Abs",
                                  style: TextStyle(
                                    fontFamily: "Quicksand",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: TColor.white,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 10.0,
                                        color: Colors.black.withOpacity(1),
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // add button
                        Positioned(
                          right: 15,
                          bottom: 10,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: TColor.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 0),
                            ),
                            onPressed: () async {
                              await _addFieldToUserDocument('abs', true);
                              print("add abs tapped");
                            },
                            child: Text(
                              "Add",
                              style: TextStyle(
                                color: TColor.primaryText,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Quicksand',
                                fontSize: 13,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ArmExercisePage()));
                            print("arm tapped");
                          },
                          child: Container(
                            margin: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              image: DecorationImage(
                                image: AssetImage('assets/img/arm.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  "Arm",
                                  style: TextStyle(
                                    fontFamily: "Quicksand",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: TColor.white,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 10.0,
                                        color: Colors.black.withOpacity(1),
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        //"Add button
                        Positioned(
                          right: 15,
                          bottom: 10,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: TColor.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 0),
                            ),
                            onPressed: () async {
                              await _addFieldToUserDocument('arm', true);
                              print("add arm tapped");
                            },
                            child: Text(
                              "Add",
                              style: TextStyle(
                                color: TColor.primaryText,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Quicksand',
                                fontSize: 13,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LegExercisePage()));
                            print("leg tapped");
                          },
                          child: Container(
                            margin: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              image: DecorationImage(
                                image: AssetImage('assets/img/leg.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  "Leg",
                                  style: TextStyle(
                                    fontFamily: "Quicksand",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: TColor.white,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 10.0,
                                        color: Colors.black.withOpacity(1),
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        //"Add button
                        Positioned(
                          right: 15,
                          bottom: 10,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: TColor.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 0),
                            ),
                            onPressed: () async {
                              await _addFieldToUserDocument('leg', true);
                              print("add leg tapped");
                            },
                            child: Text(
                              "Add",
                              style: TextStyle(
                                color: TColor.primaryText,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Quicksand',
                                fontSize: 13,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BackExercisePage()));
                            print("back tapped");
                          },
                          child: Container(
                            margin: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              image: DecorationImage(
                                image: AssetImage('assets/img/back.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  "Back",
                                  style: TextStyle(
                                    fontFamily: "Quicksand",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: TColor.white,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 10.0,
                                        color: Colors.black.withOpacity(1),
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        //"Add button
                        Positioned(
                          right: 15,
                          bottom: 10,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: TColor.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 0),
                            ),
                            onPressed: () async {
                              await _addFieldToUserDocument('back', true);
                              print("add back tapped");
                            },
                            child: Text(
                              "Add",
                              style: TextStyle(
                                color: TColor.primaryText,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Quicksand',
                                fontSize: 13,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, right: 15, left: 45),
                  child: Text(
                    "Recommended",
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 25,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      if (randomWorkoutName == "Abs") {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AbsExercisePage()));
                      } else if (randomWorkoutName == "Arm") {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ArmExercisePage()));
                      } else if (randomWorkoutName == "Leg") {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LegExercisePage()));
                      } else if (randomWorkoutName == "Back") {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BackExercisePage()));
                      }

                      print("Recommended workout tapped");
                    },
                    child: Container(
                      width: 300,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              randomWorkoutImage,
                              width: 300,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              randomWorkoutName,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.black.withOpacity(0.5),
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
