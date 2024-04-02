import 'package:flutter/material.dart';
import 'package:sporthub/common/color_extension.dart';

Widget buildEmail() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(
            left: 20, right: 20), // Atur jarak dari kiri dan kanan
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
  );
}
