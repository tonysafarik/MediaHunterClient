import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:http/http.dart' as http;
import 'package:sample_flutter_app/Channel.dart';
import 'package:sample_flutter_app/ChannelItem.dart';
import 'package:sample_flutter_app/Configuration.dart';

class ChannelList extends StatefulWidget {
  @override
  _ChannelListState createState() => _ChannelListState();
}

class _ChannelListState extends State<ChannelList> {
  List<Widget> _channels = new List();

  @override
  Widget build(BuildContext context) {
    Widget renderedItem;
    if (_channels.length > 0) {
      renderedItem = ListView(children: _channels);
    } else {
      renderedItem = Text("Loading");
    }

    return RefreshIndicator(
      onRefresh: _handleRefresh,
      child: renderedItem
    );
  }


  @override
  void initState() {
    super.initState();
    _getFeaturedChannels();
  }

  Future<void> _handleRefresh() async {
    _getFeaturedChannels();
  }

  Future<void> _getFeaturedChannels() async {
    http.Response response = await http.get(Uri.encodeFull(Configuration.BACKEND_URL + "/api/channels"));
    List<dynamic> array = json.decode(response.body);
    List<Channel> posts = new List();
    for (int i = 0; i < array.length; i++) {
      Map<String, dynamic> post = array[i];
      posts.add(Channel.fromJson(post));
    }
    List<Widget> channels = posts.map((post) => new ChannelItem(post: post)).toList();
    setState(() {
      _channels = channels;
    });
  }
}
