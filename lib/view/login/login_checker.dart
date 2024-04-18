import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sporthub/view/home/home_page.dart';
import 'package:sporthub/view/login/login_screen.dart';
import 'package:sporthub/view/login/on_boarding_view.dart';
import 'package:sporthub/view/view.dart';

class LoginChecker extends StatelessWidget {
  const LoginChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomeView();
            } else {
              // return LoginScreen();
              return OnBoardingView();
            }
          }),
    );
  }
}
