import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sample_flutter_app/ChannelList.dart';
import 'package:sample_flutter_app/MultiMediumItem.dart';
import 'package:sample_flutter_app/MultimediumList.dart';
import 'package:sample_flutter_app/Multimedium.dart';
import 'package:http/http.dart' as http;

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  List<Widget> _views = [
    MultimediumList(),
    ChannelList(),
  ];

  void _onMenuItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text("Media Hunter Client App"),
        ),
        backgroundColor: Colors.black,
      ),
      body: _views[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            title: Text("Multimedia"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text("Featured Channels"),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onMenuItemTapped,
      ),
    );
  }
}
