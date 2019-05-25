import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sample_flutter_app/MainPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MainPage(title: 'Blading Media'),
    );
  }
}
