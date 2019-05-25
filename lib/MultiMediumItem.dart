import 'package:flutter/material.dart';
import 'package:sample_flutter_app/Description.dart';
import 'package:sample_flutter_app/Multimedium.dart';
import 'package:sample_flutter_app/Thumbnail.dart';

class MultiMediumItem extends StatefulWidget {
  Multimedium post;

  MultiMediumItem({this.post});

  @override
  _MultiMediumItemState createState() => _MultiMediumItemState();
}

class _MultiMediumItemState extends State<MultiMediumItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Thumbnail(
            thumbnail: widget.post.thumbnail.highResolution,
            uri: widget.post.uri,
          ),
          Description(
            name: widget.post.name,
            description: widget.post.description,
          ),
        ],
      ),
    );
  }
}
