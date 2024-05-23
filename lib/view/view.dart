import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sporthub/common/color_extension.dart';
import 'package:sporthub/customShapeAppBar.dart';
import 'package:sporthub/view/home/home_page.dart';
import 'package:sporthub/view/setting_page/settings.dart';
import 'package:sporthub/view/report/report.dart';
import 'package:sporthub/view/workout/workout.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const homePage(),
    const workoutPage(),
    const reportPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 600),
        color: TColor.primary,
        items: [
          Icon(Icons.home_rounded),
          Icon(Icons.sports_gymnastics_outlined),
          Icon(Icons.auto_graph_rounded),
          Icon(Icons.settings),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
