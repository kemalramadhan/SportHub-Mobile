import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sporthub/common/color_extension.dart';
import 'package:sporthub/service/firestore.dart';
import 'package:sporthub/view/login/signup_checker.dart';

class signUpScreen extends StatefulWidget {
  const signUpScreen({super.key});

  @override
  State<signUpScreen> createState() => signUpScreenState();
}

// ignore: camel_case_types
class signUpScreenState extends State<signUpScreen> {
  final FirestoreProfile firestoreProfile = FirestoreProfile();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  // create a user document and collect them in firestore
  Future<void> createUserDocument(UserCredential userCredential) async {
    User? user = userCredential.user;
    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user.email).set({
        'uid': user.uid, // Menyimpan UID pengguna
        'email': user.email, // Menyimpan email pengguna
        'first name':
            _firstNameController.text, // Menyimpan nama depan pengguna
        'last name':
            _lastNameController.text, // Menyimpan nama belakang pengguna
      });
    }
  }

  Future<void> signUp() async {
    if (passwordConfirmed()) {
      try {
        // Mendaftarkan pengguna dengan email dan password
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        // Membuat dokumen pengguna dan menambahkannya ke Firestore
        await createUserDocument(userCredential);
      } on FirebaseAuthException catch (e) {
        // Menangani kesalahan saat pembuatan akun
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Gagal mendaftar: ${e.message}')));
      }
    } else {
      // Menampilkan pesan kesalahan jika konfirmasi password tidak cocok
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Konfirmasi password tidak cocok')));
    }
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: Stack(
            children: [
              Image.asset(
                "assets/img/on_boarding_view.png",
                width: media.width,
                height: media.height,
                fit: BoxFit.cover,
              ),
              SingleChildScrollView(
                // ignore: sized_box_for_whitespace
                child: Container(
                  height: media.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 0),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Hello,",
                          style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 35,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Welcome to the club.",
                          style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 25,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // build first name text field
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20,
                                right: 20), // Atur jarak dari kiri dan kanan
                            child: Text(
                              "First Name",
                              style: TextStyle(
                                  color: TColor.primaryText,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: TColor.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 6,
                                    offset: Offset(0, 6),
                                  ),
                                ],
                              ),
                              height: 60,
                              // ignore: prefer_const_constructors
                              child: TextField(
                                controller: _firstNameController,
                                keyboardType: TextInputType.visiblePassword,
                                style: const TextStyle(color: Colors.black87),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                    Icons.person_2_rounded,
                                    color: Color(0xffFCA311),
                                  ),
                                  hintText: "Enter your first name",
                                  hintStyle: TextStyle(color: Colors.black38),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),

                      // build last name text field
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20,
                                right: 20), // Atur jarak dari kiri dan kanan
                            child: Text(
                              "Last Name",
                              style: TextStyle(
                                  color: TColor.primaryText,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: TColor.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 6,
                                    offset: Offset(0, 6),
                                  ),
                                ],
                              ),
                              height: 60,
                              // ignore: prefer_const_constructors
                              child: TextField(
                                controller: _lastNameController,
                                keyboardType: TextInputType.visiblePassword,
                                style: const TextStyle(color: Colors.black87),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                    Icons.person_2_rounded,
                                    color: Color(0xffFCA311),
                                  ),
                                  hintText: "Enter your last name",
                                  hintStyle: TextStyle(color: Colors.black38),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),

                      // build email text field
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20,
                                right: 20), // Atur jarak dari kiri dan kanan
                            child: Text(
                              "Email",
                              style: TextStyle(
                                  color: TColor.primaryText,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: TColor.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 6,
                                    offset: Offset(0, 6),
                                  ),
                                ],
                              ),
                              height: 60,
                              // ignore: prefer_const_constructors
                              child: TextField(
                                controller: _emailController,
                                keyboardType: TextInputType.visiblePassword,
                                style: const TextStyle(color: Colors.black87),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Color(0xffFCA311),
                                  ),
                                  hintText: "Enter your email",
                                  hintStyle: TextStyle(color: Colors.black38),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),

                      // build password textfield
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20,
                                right: 20), // Atur jarak dari kiri dan kanan
                            child: Text(
                              "Password",
                              style: TextStyle(
                                  color: TColor.primaryText,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: TColor.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 6,
                                    offset: Offset(0, 6),
                                  ),
                                ],
                              ),
                              height: 60,
                              child: TextField(
                                controller: _passwordController,
                                obscureText: true,
                                style: const TextStyle(color: Colors.black87),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Color(0xffFCA311),
                                  ),
                                  hintText: "Enter your password",
                                  hintStyle: TextStyle(color: Colors.black38),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),

                      // build confirm password textfield
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20,
                                right: 20), // Atur jarak dari kiri dan kanan
                            child: Text(
                              "Confirm Password",
                              style: TextStyle(
                                  color: TColor.primaryText,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: TColor.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 6,
                                    offset: Offset(0, 6),
                                  ),
                                ],
                              ),
                              height: 60,
                              child: TextField(
                                controller: _confirmPasswordController,
                                obscureText: true,
                                style: const TextStyle(color: Colors.black87),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Color(0xffFCA311),
                                  ),
                                  hintText: "Confirm your password",
                                  hintStyle: TextStyle(color: Colors.black38),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 30),

                      // build login signup button
                      GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 20),
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              // Gunakan Navigator dengan context yang diterima dari parameter
                              await signUp();
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpChecker()));
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 10,
                              backgroundColor: TColor.white,
                              padding: const EdgeInsets.all(15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text(
                              "SIGN UP",
                              style: TextStyle(
                                color: Color(0xffFCA311),
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
