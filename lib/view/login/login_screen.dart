import 'package:flutter/material.dart';
import 'package:sporthub/common/color_extension.dart';
import 'package:sporthub/view/login/build_email.dart';
import 'package:sporthub/view/login/build_login_button.dart';
import 'package:sporthub/view/login/build_password.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
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
                      "Welcome Back!",
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
                      "Get into your routine, buddy.",
                      style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(height: 30),
                  buildEmail(),
                  const SizedBox(height: 10),
                  buildPassword(),
                  const SizedBox(height: 30),
                  buildLoginBtn(),
                ],
              )
            ],
          ),
        ));
  }
}
