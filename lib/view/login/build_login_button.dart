import 'package:flutter/material.dart';
import 'package:sporthub/common/color_extension.dart';

Widget buildLoginBtn() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () => print("Login Pressed"), // Perbaikan fungsi onPressed
      style: ElevatedButton.styleFrom(
        elevation: 5, backgroundColor: TColor.white,
        padding: const EdgeInsets.all(15), // Padding diletakkan di sini
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: const Text(
        "LOGIN",
        style: TextStyle(
          color: Color(0xffFCA311),
          fontSize: 18,
          fontWeight: FontWeight.w900,
        ),
      ),
    ),
  );
}
