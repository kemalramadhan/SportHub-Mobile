import 'package:flutter/material.dart';
import 'package:sporthub/common/color_extension.dart';
import 'package:sporthub/customShapeAppBar.dart';
import 'package:sporthub/service/firestore.dart';
import 'package:sporthub/view/view.dart';
import 'package:sporthub/view/workout/exercise/LegExercisePage.dart';

class LegExercisePage extends StatelessWidget {
  final List<Map<String, String>> exercises = [
    {
      'name': 'Bodyweight Squat',
      'subtitle': '3 sets of 10 reps',
      'image': 'assets/img/bodyweight squat.jpg'
    },
    {
      'name': 'Glute Bridge March',
      'subtitle': '3 sets of 10 reps',
      'image': 'assets/img/jump squat.jpg'
    },
    {
      'name': 'Glute Bridge March',
      'subtitle': '3 sets of 10 reps',
      'image': 'assets/img/Glute Bridge March.jpg'
    },
    {
      'name': 'Lateral Lunge',
      'subtitle': '3 sets of 12 reps',
      'image': 'assets/img/Lateral Lunge.jpg'
    },
    {
      'name': 'Side-Lying Leg Raise',
      'subtitle': '3 sets of 15 reps',
      'image': 'assets/img/Side-Lying Leg Raise.jpg'
    },
    {
      'name': 'Pistol Squats',
      'subtitle': '3 sets of 10 reps',
      'image': 'assets/img/pistol squats.jpg'
    },
    {
      'name': 'Jumping Lunge',
      'subtitle': '3 sets of 10 reps',
      'image': 'assets/img/jumping lunge.jpg'
    },
    {
      'name': 'Frog Pump',
      'subtitle': '3 sets of 10 reps',
      'image': 'assets/img/frog pump.jpg'
    },
    {
      'name': 'Donkey Kick',
      'subtitle': '3 sets of 10 reps',
      'image': 'assets/img/donkey kick.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: ClipPath(
          clipper: CustomShapeAppBar(),
          child: Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            color: TColor.primary,
            child: Center(
              child: Text(
                "SportHub",
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 29,
                  fontWeight: FontWeight.w900,
                  color: TColor.white,
                ),
              ),
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Judul di bawah AppBar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                "Leg Exercises",
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.grey.withOpacity(0.6),
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
            ),
            // Image at the top with rounded corners
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    20.0), // Adjust the corner radius here
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img/leg.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: exercises.map((exercise) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Exercise image with rounded corners
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            exercise['image']!,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 16),
                        // Exercise details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                exercise['name']!,
                                style: TextStyle(
                                  fontFamily: "Quicksand",
                                  fontSize: 21,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                exercise['subtitle']!,
                                style: TextStyle(
                                  fontFamily: "Quicksand",
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Center(
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeView()));
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 10,
                    backgroundColor: TColor.white,
                    padding: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    "Try Another Workout",
                    style: TextStyle(
                      color: Color(0xffFCA311),
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
