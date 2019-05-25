import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:sample_flutter_app/Configuration.dart';
import 'package:sample_flutter_app/MultiMediumItem.dart';

import 'Multimedium.dart';

class MultimediumList extends StatefulWidget {
  @override
  _MultimediumListState createState() => _MultimediumListState();
}

class _MultimediumListState extends State<MultimediumList> {
  int counter = 0;
  List<Multimedium> _posts = new List();

  @override
  Widget build(BuildContext context) {
    List<Widget> multimedia = new List();

    multimedia.addAll(_posts.map((item) => new MultiMediumItem(post: item)).toList());

    multimedia.add(Padding(
      padding: EdgeInsets.only(top: 10, bottom: 20, left: 40, right: 40),
      child: RaisedButton(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            "Load more",
            style: TextStyle(fontSize: 20),
          ),
        ),
        onPressed: _loadAnotherPage,
      ),
    ));

    return RefreshIndicator(
      onRefresh: _handleRefresh,
      child: ListView(children: multimedia),
    );
  }

  @override
  void initState() {
    super.initState();
    _handleRefresh();
  }

  Future<void> _handleRefresh() async {
    Completer completer = new Completer();
    setState(() {
      counter = 0;
    });
    completer.complete(_getPageOfPosts(0));
    return completer.future;
  }

  _loadAnotherPage() {
    setState(() {
      counter++;
    });
    _getPageOfPosts(counter);
  }

  Future<void> _getPageOfPosts(int page) async {
    http.Response response = await http.get(Uri.encodeFull(Configuration.BACKEND_URL + "/api/records/" + page.toString()));
    List<dynamic> array = json.decode(response.body);
    List<Multimedium> posts;
    if (page == 0) {
      posts = new List();
    } else {
      posts = _posts;
    }
    for (int i = 0; i < array.length; i++) {
      Map<String, dynamic> post = array[i];
      posts.add(Multimedium.fromJson(post));
    }
    setState(() {
      _posts = posts;
    });
    return;
  }
}
