import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sample_flutter_app/ChannelList.dart';
import 'package:sample_flutter_app/MultimediumList.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  List<Widget> _views;
  bool splash = true;

  @override
  void initState() {
    super.initState();
    _views = [
      MultimediumList(
        splashDisappear: splashScreenDisappear,
      ),
      ChannelList(),
    ];
  }

  void _onMenuItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget splashScreen() {
    return Visibility(
      child: Center(
        child: Container(
          color: Colors.blue,
          child: Text(
            widget.title,
            style: TextStyle(fontSize: 12, color: Colors.black, decoration: TextDecoration.none, fontFamily: "Roboto Condensed"),
          ),
          alignment: Alignment(0.0, 0.0),
        ),
      ),
      visible: splash,
    );
  }

  void splashScreenDisappear() {
    setState(() {
      splash = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Center(
              child: Text(widget.title),
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
        ),
        splashScreen()
      ],
    );
  }
}
