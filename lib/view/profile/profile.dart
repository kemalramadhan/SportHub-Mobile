import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sporthub/common/color_extension.dart';
import 'package:sporthub/view/login/on_boarding_view.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // Image.asset(
                //   "assets/img/on_boarding_view.png",
                //   width: media.width,
                //   height: media.height,
                //   fit: BoxFit.cover,
                // ),
                Column(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Menambahkan ini untuk memusatkan konten secara vertikal
                  children: [
                    SizedBox(height: 0),
                    Center(
                      // Center digunakan untuk menempatkan widget di tengah
                      child: Container(
                        width: 130.0, // Atur lebar foto
                        height: 130.0, // Atur tinggi foto
                        decoration: BoxDecoration(
                          // Membuat foto menjadi lingkaran
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                "assets/img/ade rai.jpeg"), // Ganti dengan path foto yang diinginkan
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10), // Memberi jarak antara foto dan nama
                    Text(
                      "Ade Rai", // Ganti dengan nama pengguna yang sesuai
                      style: TextStyle(
                        fontSize: 30.0, // Atur ukuran teks
                        fontWeight: FontWeight.bold, // Atur ketebalan teks
                        color: TColor.black, // Atur warna teks
                      ),
                    ),
                    SizedBox(height: 0), // Memberi jarak antara foto dan nama
                    Text(
                      user.email!, // Ganti dengan nama pengguna yang sesuai
                      style: TextStyle(
                        fontSize: 20.0, // Atur ukuran teks
                        fontWeight: FontWeight.w500, // Atur ketebalan teks
                        color: TColor.black, // Atur warna teks
                      ),
                    ),

                    // divider line
                    const SizedBox(
                        height: 30), // Jarak antara email dan garis pemisah
                    Container(
                      width: media.width *
                          0.8, // Atur lebar garis sesuai kebutuhan
                      height: 1.5, // Atur ketebalan garis
                      color: TColor
                          .gray, // Atur warna garis, ganti TColor.gray dengan warna sesuai kebutuhan
                    ),
                    const SizedBox(height: 30),

                    // profile list
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 229, 229, 229),
                              shape: BoxShape.circle),
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.person_2_outlined,
                              color: Color.fromARGB(255, 252, 163, 17),
                              size: 35,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Profile",
                          style: TextStyle(
                              color: TColor.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                        SizedBox(width: 100),
                        Container(
                          decoration: ShapeDecoration(
                            // color: TColor.white,
                            color: Color.fromARGB(200, 229, 229, 229),
                            shape: CircleBorder(),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: TColor.primary,
                              size: 30,
                            ),
                            onPressed: () {
                              // Aksi ketika tombol ditekan
                              print("Edit button tapped");
                            },
                          ),
                        )
                      ],
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    // report list
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 229, 229, 229),
                              shape: BoxShape.circle),
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.auto_graph_rounded,
                              color: Color.fromARGB(255, 252, 163, 17),
                              size: 35,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Workout Report",
                          style: TextStyle(
                              color: TColor.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                        SizedBox(width: 10),
                        Container(
                          decoration: ShapeDecoration(
                            // color: TColor.white,
                            color: Color.fromARGB(200, 229, 229, 229),
                            shape: CircleBorder(),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: TColor.primary,
                              size: 30,
                            ),
                            onPressed: () {
                              // Aksi ketika tombol ditekan
                              print("Edit button tapped");
                            },
                          ),
                        )
                      ],
                    ),

                    // divider line
                    const SizedBox(
                        height: 30), // Jarak antara email dan garis pemisah
                    Container(
                      width: media.width *
                          0.8, // Atur lebar garis sesuai kebutuhan
                      height: 1.5, // Atur ketebalan garis
                      color: TColor
                          .gray, // Atur warna garis, ganti TColor.gray dengan warna sesuai kebutuhan
                    ),

                    const SizedBox(height: 30),

                    // theme switch
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 229, 229, 229),
                              shape: BoxShape.circle),
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.light_mode_outlined,
                              color: Color.fromARGB(255, 252, 163, 17),
                              size: 35,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Theme",
                          style: TextStyle(
                              color: TColor.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                        SizedBox(width: 100),
                        Container(
                          decoration: ShapeDecoration(
                            // color: TColor.white,
                            color: Color.fromARGB(200, 229, 229, 229),
                            shape: CircleBorder(),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: TColor.primary,
                              size: 30,
                            ),
                            onPressed: () {
                              // Aksi ketika tombol ditekan
                              print("Edit button tapped");
                            },
                          ),
                        )
                      ],
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 229, 229, 229),
                              shape: BoxShape.circle),
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.logout_outlined,
                              color: Color.fromARGB(255, 252, 163, 17),
                              size: 35,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Logout",
                          style: TextStyle(
                              color: TColor.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                        SizedBox(width: 100),
                        Container(
                          decoration: ShapeDecoration(
                            // color: TColor.white,
                            color: Color.fromARGB(200, 229, 229, 229),
                            shape: CircleBorder(),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.redAccent.shade400,
                              size: 30,
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const OnBoardingView()));
                              // Aksi ketika tombol ditekan
                              FirebaseAuth.instance.signOut();
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
