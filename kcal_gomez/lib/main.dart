import 'dart:developer';

import 'fooddisp.dart';
import 'homepage.dart';
import 'package:flutter/material.dart';

import 'introscreen.dart';

int _dex = 1;
final List<String> imgList = [
  'assets/intro1.png',
  'assets/intro2.png',
  'assets/intro3.png'
];
void main() {
  runApp(MyApp());
}

dexChng(int index) {
  _dex = index;
  print("Dex changed.");
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GOMEZ_KCAL',
      initialRoute: '/',
      routes: {
        // '/': (context) => LandingPage(),
        '/homepage': (context) => HomePage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.blue,
      ),
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LandingPageBody());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBodyPage(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black26,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Cam',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.thumb_up), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
        ],
      ),
    );
  }
}

class FoodDisp extends StatelessWidget {
  const FoodDisp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: FoodDispPage());
  }
}
