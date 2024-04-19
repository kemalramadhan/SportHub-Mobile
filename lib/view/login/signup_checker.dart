import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sporthub/view/login/on_boarding_view.dart';
import 'package:sporthub/view/login/signup_screen.dart';
import 'package:sporthub/view/view.dart';

class SignUpChecker extends StatelessWidget {
  const SignUpChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomeView();
            } else {
              return signUpScreen();
            }
          }),
    );
  }
}
