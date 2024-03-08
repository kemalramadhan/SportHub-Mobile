import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sporthub/common/color_extension.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 30, top: 30, right: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage("assets/img/ade rai.jpeg"),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            children: [
                              const TextSpan(
                                text: "Welcome Back!\n",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  fontFamily: 'Quicksand',
                                ),
                              ),
                              TextSpan(
                                text: "BUDIMAN",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Quicksand',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.keyboard_arrow_right_rounded),
                    color: Colors.black,
                    iconSize: 50,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            const Padding(
              padding: EdgeInsets.all(25),
              child: Text(
                "Categories",
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 25,
                    fontWeight: FontWeight.w800),
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
              items: [
                Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      image: AssetImage('assets/img/abs.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Abs",
                        style: TextStyle(
                          fontFamily: "Quicksand",
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: TColor.white,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black.withOpacity(1),
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      image: AssetImage('assets/img/arm.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Arm",
                        style: TextStyle(
                          fontFamily: "Quicksand",
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: TColor.white,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black.withOpacity(1),
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      image: AssetImage('assets/img/leg.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Leg",
                        style: TextStyle(
                          fontFamily: "Quicksand",
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: TColor.white,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black.withOpacity(1),
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(25),
              child: Text(
                "Previous Workout",
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 25,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Center(
              child: Container(
                width: 300,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Stack(
                  alignment:
                      Alignment.bottomLeft, // Menentukan posisi teks di tengah
                  children: [
                    // Background image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        'assets/img/back.jpg',
                        width: 300,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),

                    // Text overlay
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Back",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              // Menambahkan bayangan untuk meningkatkan kontras
                              blurRadius: 10.0,
                              color: Colors.black.withOpacity(0.5),
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Tombol di atas gambar
                    Positioned(
                      right: 10, // Atur posisi horizontal dari kanan
                      top: 10, // Atur posisi vertikal dari atas
                      child: IconButton(
                        icon: Icon(Icons.edit,
                            color: Colors
                                .white), // Ganti dengan icon yang diinginkan
                        onPressed: () {
                          // Aksi ketika tombol ditekan
                          print("Edit button tapped");
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
