import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class Thumbnail extends StatefulWidget {
  String thumbnail;
  String uri;

  Thumbnail({this.thumbnail, this.uri});

  @override
  _ThumbnailState createState() => _ThumbnailState();
}

class _ThumbnailState extends State<Thumbnail> {

  _launchURL() async {
    if (await canLaunch(widget.uri)) {
      await launch(widget.uri);
    } else {
      throw 'Could not launch $widget.uri';
    }
  }

  ImageProvider _renderImage(){
    if (widget.thumbnail == null) {
      return new AssetImage("images/thumbnail.jpg");
    }
    return new NetworkImage(widget.thumbnail);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchURL,
      child: Center(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.fitWidth,
              alignment: FractionalOffset.center,
              image: _renderImage(),
            )),
          ),
        ),
      ),
    );
  }
}
