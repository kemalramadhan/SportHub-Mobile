import 'package:flutter/material.dart';

class reportPage extends StatelessWidget {
  const reportPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final Size media = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/img/on_boarding_view.png",
            width: media.width,
            height: media.height,
            fit: BoxFit.cover,
          ),
          const SingleChildScrollView(),
        ],
      ),
    );
  }
}
