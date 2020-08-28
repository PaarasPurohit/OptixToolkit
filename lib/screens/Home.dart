import 'dart:async';

import 'package:OptixToolkit/services/NavigationService.dart';
import 'package:OptixToolkit/services/firebase.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:OptixToolkit/Icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:OptixToolkit/screens/Form.dart';
import 'package:OptixToolkit/screens/pages/HomePage.dart';
import 'package:OptixToolkit/screens/pages/ToolsPage.dart';
import 'package:OptixToolkit/screens/pages/PartsPage.dart';

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);


  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  final Color background = Color(0xff26292c);
  final Color lightBackground = Color(0xff3a3d41);
  final Color blue = Color(0xff159deb);
  final Color white = Color(0xffffffff);
  final List<String> titles = ["HOME", "TOOLS", "PARTS", "PROFILE"];
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    homePage(),
    toolsPage(),
    partsPage(),
    Text("loading bruh..."),
    Text("loading bruh..."),
    Text("loading bruh..."),
    Container(
      child: Column(
        children: [
          Text("Loading Profile"),
        ],
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    //LogOut();
  }

  Future LogOut() async {
    await Auth.signOut();
    NavigationService.navigateTo(PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => FormPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(titles[_selectedIndex],
                style: GoogleFonts.rubik(fontWeight: FontWeight.bold))),
        backgroundColor: blue,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      backgroundColor: background,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: background,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Icon(Icons.home),
            ),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Icon(FlutterIcons.tools),
            ),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Icon(FlutterIcons.parts),
            ),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Icon(Icons.person),
            ),
            title: Container(),
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: white,
        selectedItemColor: blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
