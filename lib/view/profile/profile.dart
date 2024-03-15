import 'package:flutter/material.dart';
import 'package:sporthub/common/color_extension.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/img/on_boarding_view.png",
                  width: media.width,
                  height: media.height,
                  fit: BoxFit.cover,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Menambahkan ini untuk memusatkan konten secara vertikal
                  children: [
                    SizedBox(height: 40),
                    Center(
                      // Center digunakan untuk menempatkan widget di tengah
                      child: Container(
                        width: 150.0, // Atur lebar foto
                        height: 150.0, // Atur tinggi foto
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
                    SizedBox(height: 5), // Memberi jarak antara foto dan nama
                    Text(
                      "Ade Rai", // Ganti dengan nama pengguna yang sesuai
                      style: TextStyle(
                        fontSize: 30.0, // Atur ukuran teks
                        fontWeight: FontWeight.bold, // Atur ketebalan teks
                        color: TColor.black, // Atur warna teks
                      ),
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
