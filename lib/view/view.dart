import 'package:flutter/material.dart';
import 'package:sporthub/common/color_extension.dart';
import 'package:sporthub/view/home/home_page.dart';
import 'package:sporthub/view/profile/profile.dart';
import 'package:sporthub/view/report/report.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const homePage(),
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
        backgroundColor: TColor.primary,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 5, top: 10),
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
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 10),
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  shape: BoxShape.circle),
              child: const Padding(
                padding: EdgeInsets.all(4.0),
                child: Icon(
                  Icons.notifications,
                  color: Color.fromARGB(255, 252, 163, 17),
                ),
              ),
            ),
          ),
        ],
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: TColor.primary,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph_rounded),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: TColor.white,
        unselectedItemColor: TColor.white,
        onTap: _onItemTapped,
        selectedLabelStyle: const TextStyle(
            fontFamily: 'Quicksand', fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(
            fontFamily: 'Quicksand', fontWeight: FontWeight.bold),
      ),
    );
  }
}
