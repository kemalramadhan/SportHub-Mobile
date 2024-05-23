import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sporthub/common/color_extension.dart';
import 'package:sporthub/customShapeAppBar.dart';
import 'package:sporthub/resources/add_data.dart';
import 'package:sporthub/utils.dart';
import 'package:sporthub/view/view.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lasttNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  Uint8List? _image;
  String? firstname;
  String? lastname;
  String? phone;
  String? age;
  String? height;
  String? weight;

  @override
  void initState() {
    super.initState();
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

  void saveProfilePicture() async {
    String resp = await StoreData().saveData(file: _image!);
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 70,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : CircleAvatar(
                          radius: 70,
                          backgroundImage:
                              AssetImage('assets/img/default profile.jpg'),
                          backgroundColor: Color.fromRGBO(0, 0, 0, 0),
                        ),
                  Positioned(
                    child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(Icons.add_a_photo_outlined),
                    ),
                    bottom: -10,
                    left: 90,
                  ),
                ],
              ),
              TextField(
                controller: _firstNameController,
                decoration: InputDecoration(labelText: 'First Name'),
              ),
              TextField(
                controller: _lasttNameController,
                decoration: InputDecoration(labelText: 'Last Name'),
              ),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone'),
              ),
              TextField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Age'),
              ),
              TextField(
                controller: _heightController,
                decoration: InputDecoration(labelText: 'Height'),
              ),
              TextField(
                controller: _weightController,
                decoration: InputDecoration(labelText: 'Weight'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  saveProfilePicture();
                  await _addFieldToUserDocument(
                      'first name', _firstNameController.text);
                  await _addFieldToUserDocument(
                      'last name', _lasttNameController.text);
                  await _addFieldToUserDocument('phone', _phoneController.text);
                  await _addFieldToUserDocument('age', _ageController.text);
                  await _addFieldToUserDocument(
                      'height', _heightController.text);
                  await _addFieldToUserDocument(
                      'weight', _weightController.text);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeView()));
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
                  "Save Changes",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
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
                  backgroundColor: Color.fromARGB(255, 229, 229, 229),
                  padding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  "Discard Changes",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
