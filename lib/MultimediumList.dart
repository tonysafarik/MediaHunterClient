import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:sample_flutter_app/MediaHunterApi.dart';
import 'package:sample_flutter_app/MultiMediumItem.dart';

import 'package:sample_flutter_app/data_objects/Multimedium.dart';

class MultimediumList extends StatefulWidget {
  VoidCallback splashDisappear;

  MultimediumList({this.splashDisappear});

  @override
  _MultimediumListState createState() => _MultimediumListState();
}

class _MultimediumListState extends State<MultimediumList> {
  int counter = 0;
  List<Multimedium> _posts = new List();
  bool disableButton = false;
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    List<Widget> multimedia = new List();
    if (_posts.length == 0) {
      multimedia.add(Center(
        child: Padding(
          child: Text(loading? "Loading" : "No data loaded."),
          padding: EdgeInsets.only(top: 50, bottom: 20),
        ),
      ));
    }
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
        onPressed: this.disableButton || this._posts.length == 0 ? null : _loadAnotherPage,
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
    _handleRefresh().then((_) => SchedulerBinding.instance.addPostFrameCallback((_) => widget.splashDisappear()));
  }

  Future<void> _handleRefresh() async {
    Completer completer = new Completer();
    setState(() {
      counter = 0;
      disableButton = false;
    });
    completer.complete(_updatePosts(0));
    return completer.future;
  }

  _loadAnotherPage() async {
    setState(() {
      counter++;
    });
    _updatePosts(counter);
  }

  Future<void> _updatePosts(int counter) async {
    setState(() {
      loading = true;
    });
    List<Multimedium> posts = await MediaHunterApi.getPageOfMultimedia(counter);
    if (counter == 0) {
      setState(() {
        _posts = posts;
        loading = false;
      });
    } else {
      bool disabled = false;
      if (posts.length < 10) {
        disabled = true;
      }
      _posts.addAll(posts);
      setState(() {
        _posts = _posts;
        disableButton = disabled;
        loading = false;
      });
    }
  }
}
