import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sporthub/common/color_extension.dart';
import 'package:sporthub/customShapeAppBar.dart';
import 'package:sporthub/service/firestore.dart';
import 'package:sporthub/view/setting_page/profile/EditProfilePage.dart';
import 'package:sporthub/view/view.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  final FirestoreService firestoreService = FirestoreService();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? profileImageURL;
  String? firstname = "Loading...";
  String? lastname = "";
  String? phone = "-";
  String? age = "-";
  String? height = "-";
  String? weight = "-";

  @override
  void initState() {
    super.initState();
    _fetchProfileValue();
  }

  Future<void> _fetchProfileValue() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentReference userDocRef =
          _firestore.collection('users').doc(user.email);
      DocumentSnapshot docSnapshot = await userDocRef.get();
      if (docSnapshot.exists && docSnapshot.data() != null) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        setState(() {
          firstname = data['first name'] as String?;
          lastname = data['last name'] as String?;
          phone = data['phone'] as String?;
          age = data['age'] as String?;
          height = data['height'] as String?;
          weight = data['weight'] as String?;
          profileImageURL = data['imageLink'] as String?;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: ClipPath(
          clipper: CustomShapeAppBar(),
          child: Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            color: TColor.primary,
            child: Center(
              child: Text(
                "SportHub",
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 29,
                  fontWeight: FontWeight.w900,
                  color: TColor.white,
                ),
              ),
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment
                        .start, // Menambahkan ini untuk memusatkan konten secara vertikal
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: ClipOval(
                          child: profileImageURL != null
                              ? Image.network(
                                  profileImageURL!,
                                  fit: BoxFit.cover,
                                  width: 130.0,
                                  height: 130.0,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                      'assets/img/default profile.jpg',
                                      fit: BoxFit.cover,
                                      width: 130.0,
                                      height: 130.0,
                                    );
                                  },
                                )
                              : Image.asset(
                                  'assets/img/default profile.jpg',
                                  fit: BoxFit.cover,
                                  width: 130.0,
                                  height: 130.0,
                                ),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      // profile list
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 40),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 229, 229, 229),
                                shape: BoxShape.circle),
                            child: const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Icon(
                                Icons.person_2_outlined,
                                color: Color.fromARGB(255, 252, 163, 17),
                                size: 35,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name",
                                style: TextStyle(
                                    color: TColor.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                              Text(
                                "$firstname $lastname",
                                style: TextStyle(
                                    color: TColor.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                          SizedBox(width: 100),
                        ],
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      // report list
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 40),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 229, 229, 229),
                                shape: BoxShape.circle),
                            child: const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Icon(
                                Icons.phone_outlined,
                                color: Color.fromARGB(255, 252, 163, 17),
                                size: 35,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Phone",
                                style: TextStyle(
                                    color: TColor.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                              Text(
                                "$phone",
                                style: TextStyle(
                                    color: TColor.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                          SizedBox(width: 10),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // theme switch
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 40),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 229, 229, 229),
                                shape: BoxShape.circle),
                            child: const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Icon(
                                Icons.numbers_outlined,
                                color: Color.fromARGB(255, 252, 163, 17),
                                size: 35,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Age",
                                style: TextStyle(
                                    color: TColor.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                              Text(
                                "$age",
                                style: TextStyle(
                                    color: TColor.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                          SizedBox(width: 100),
                        ],
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 40),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 229, 229, 229),
                                shape: BoxShape.circle),
                            child: const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Icon(
                                Icons.height_outlined,
                                color: Color.fromARGB(255, 252, 163, 17),
                                size: 35,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Height",
                                style: TextStyle(
                                    color: TColor.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                              Text(
                                "$height Cm",
                                style: TextStyle(
                                    color: TColor.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                          SizedBox(width: 100),
                        ],
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 40),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 229, 229, 229),
                                shape: BoxShape.circle),
                            child: const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Icon(
                                Icons.monitor_weight_outlined,
                                color: Color.fromARGB(255, 252, 163, 17),
                                size: 35,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Weight",
                                style: TextStyle(
                                    color: TColor.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                              Text(
                                "$weight Kg",
                                style: TextStyle(
                                    color: TColor.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                          SizedBox(width: 100),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 0),
                            child: Center(
                              child: ElevatedButton(
                                onPressed: () async {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeView(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 10,
                                  backgroundColor:
                                      Color.fromARGB(255, 229, 229, 229),
                                  padding: const EdgeInsets.all(10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: const Text(
                                  "Cancel Edit",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 0),
                            child: Center(
                              child: ElevatedButton(
                                onPressed: () async {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditProfilePage(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 10,
                                  backgroundColor: TColor.primary,
                                  padding: const EdgeInsets.all(10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: const Text(
                                  "Edit Profile",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
