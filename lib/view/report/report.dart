import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sporthub/common/color_extension.dart';
import 'package:sporthub/service/firestore.dart';
import 'package:sporthub/view/workout/exercise/AbsExercisePage.dart';
import 'package:sporthub/view/workout/exercise/ArmExercisePage.dart';
import 'package:sporthub/view/workout/exercise/BackExercisePage.dart';
import 'package:sporthub/view/workout/exercise/LegExercisePage.dart';

class reportPage extends StatefulWidget {
  const reportPage({Key? key}) : super(key: key);

  @override
  State<reportPage> createState() => _reportPageState();
}

class _reportPageState extends State<reportPage> {
  final FirestoreService firestoreService = FirestoreService();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool? arm; // State to store the value of arm field
  bool? abs;
  bool? back;
  bool? leg;

  @override
  void initState() {
    super.initState();
    _fetchArmValue(); // Fetch the arm value when the widget is initialized
    _fetchAbsValue();
    _fetchBackValue();
    _fetchLegValue();
  }

  Future<void> _fetchArmValue() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentReference userDocRef =
          _firestore.collection('users').doc(user.email);
      DocumentSnapshot docSnapshot = await userDocRef.get();
      if (docSnapshot.exists && docSnapshot.data() != null) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        setState(() {
          arm = data['arm'] as bool?; // Update the state with the fetched value
        });
      }
    }
  }

  Future<void> _fetchAbsValue() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentReference userDocRef =
          _firestore.collection('users').doc(user.email);
      DocumentSnapshot docSnapshot = await userDocRef.get();
      if (docSnapshot.exists && docSnapshot.data() != null) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        setState(() {
          abs = data['abs'] as bool?; // Update the state with the fetched value
        });
      }
    }
  }

  Future<void> _fetchLegValue() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentReference userDocRef =
          _firestore.collection('users').doc(user.email);
      DocumentSnapshot docSnapshot = await userDocRef.get();
      if (docSnapshot.exists && docSnapshot.data() != null) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        setState(() {
          leg = data['leg'] as bool?; // Update the state with the fetched value
        });
      }
    }
  }

  Future<void> _fetchBackValue() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentReference userDocRef =
          _firestore.collection('users').doc(user.email);
      DocumentSnapshot docSnapshot = await userDocRef.get();
      if (docSnapshot.exists && docSnapshot.data() != null) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        setState(
          () {
            back = data['back']
                as bool?; // Update the state with the fetched value
          },
        );
      }
    }
  }

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Conditionally display arm exercise
            if (arm == true)
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ArmExercisePage()));
                    print("arm tapped");
                  },
                  child: Container(
                    width: 350,
                    height: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: const DecorationImage(
                        image: AssetImage('assets/img/arm.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Arm",
                              style: TextStyle(
                                fontFamily: "Quicksand",
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: TColor.white,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.black.withOpacity(0.5),
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // see more button
                        Positioned(
                          right: 15,
                          bottom: 10,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: TColor.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 0),
                            ),
                            onPressed: () async {
                              await _addFieldToUserDocument('arm', false);
                              print("remove arm tapped");
                            },
                            child: Text(
                              "Remove",
                              style: TextStyle(
                                color: TColor.primaryText,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Quicksand',
                                fontSize: 15,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            const SizedBox(
              height: 20,
            ),
            // leg exercise
            if (leg == true)
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LegExercisePage()));
                    print("leg tapped");
                  },
                  child: Container(
                    width: 350,
                    height: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: const DecorationImage(
                        image: AssetImage('assets/img/leg.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Leg",
                              style: TextStyle(
                                fontFamily: "Quicksand",
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: TColor.white,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.black.withOpacity(0.5),
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Add button
                        Positioned(
                          right: 15,
                          bottom: 10,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: TColor.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 0),
                            ),
                            onPressed: () async {
                              await _addFieldToUserDocument('leg', false);
                              print("remove leg tapped");
                            },
                            child: Text(
                              "Remove",
                              style: TextStyle(
                                color: TColor.primaryText,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Quicksand',
                                fontSize: 15,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            const SizedBox(
              height: 20,
            ),
            // abs exercise
            if (abs == true)
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AbsExercisePage()));
                    print("abs tapped");
                  },
                  child: Container(
                    width: 350,
                    height: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: const DecorationImage(
                        image: AssetImage('assets/img/abs.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Abs",
                              style: TextStyle(
                                fontFamily: "Quicksand",
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: TColor.white,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.black.withOpacity(0.5),
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Add button
                        Positioned(
                          right: 15,
                          bottom: 10,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: TColor.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 0),
                            ),
                            onPressed: () async {
                              await _addFieldToUserDocument('abs', false);
                              print("remove abs tapped");
                            },
                            child: Text(
                              "Remove",
                              style: TextStyle(
                                color: TColor.primaryText,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Quicksand',
                                fontSize: 15,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            const SizedBox(
              height: 20,
            ),
            // back exercise
            if (back == true)
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BackExercisePage()));
                    print("back tapped");
                  },
                  child: Container(
                    width: 350,
                    height: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: const DecorationImage(
                        image: AssetImage('assets/img/back.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Back",
                              style: TextStyle(
                                fontFamily: "Quicksand",
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: TColor.white,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.black.withOpacity(0.5),
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Add button
                        Positioned(
                          right: 15,
                          bottom: 10,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: TColor.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 0),
                            ),
                            onPressed: () async {
                              await _addFieldToUserDocument('back', false);
                              print("remove back tapped");
                            },
                            child: Text(
                              "Remove",
                              style: TextStyle(
                                color: TColor.primaryText,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Quicksand',
                                fontSize: 15,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            if (arm == false && leg == false && back == false && abs == false)
              Center(
                child: Container(
                  child: Text(
                    "Go Get Your Workout Exercise!",
                    style: TextStyle(
                      color: Color(0xffFCA311),
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
