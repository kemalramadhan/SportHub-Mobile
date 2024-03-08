import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sporthub/common/color_extension.dart';
import 'package:sporthub/view/home/home_page.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    homePage(),
    Text('Search Page'),
    Text('Profile Page'),
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
        backgroundColor: TColor.blue,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(left: 5, top: 10),
          child: Text(
            "SportHub",
            style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: TColor.primary,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 10),
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 229, 229, 229),
                  shape: BoxShape.circle),
              child: const Padding(
                padding: EdgeInsets.all(7.0),
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: TColor.primary,
        onTap: _onItemTapped,
      ),
    );
  }
}
