import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sample_flutter_app/Description.dart';

import 'Channel.dart';

class ChannelItem extends StatefulWidget {
  Channel post;

  ChannelItem({this.post});

  @override
  _ChannelItemState createState() => _ChannelItemState();
}

class _ChannelItemState extends State<ChannelItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Description(
        name: widget.post.name,
        description: widget.post.mcpName,
        uri: widget.post.uri,
      ),
    );
  }
}
