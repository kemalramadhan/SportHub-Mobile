import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sporthub/common/color_extension.dart';

class workoutPage extends StatelessWidget {
  const workoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // arm
            Center(
              child: Container(
                width: 350,
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
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
                                offset: Offset(0, 3),
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                        ),
                        onPressed: () {
                          // Add your on-pressed action here
                        },
                        child: Text(
                          "See More",
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
            SizedBox(
              height: 20,
            ),
            // leg
            Center(
              child: Container(
                width: 350,
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
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
                                offset: Offset(0, 3),
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                        ),
                        onPressed: () {
                          // Add your on-pressed action here
                        },
                        child: Text(
                          "See More",
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
            SizedBox(
              height: 20,
            ),
            // abs
            Center(
              child: Container(
                width: 350,
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
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
                                offset: Offset(0, 3),
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                        ),
                        onPressed: () {
                          // Add your on-pressed action here
                        },
                        child: Text(
                          "See More",
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
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: 350,
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
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
                                offset: Offset(0, 3),
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                        ),
                        onPressed: () {
                          // Add your on-pressed action here
                        },
                        child: Text(
                          "See More",
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
          ],
        ),
      ),
    );
  }
}
