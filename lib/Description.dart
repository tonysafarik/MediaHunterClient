import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class Description extends StatefulWidget {
  String name;
  String description;
  String uri;

  Description({this.name, this.description, this.uri});

  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: GestureDetector(
        onTap: _onWidgetTap,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                widget.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: widget.description != null? Text(
                widget.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ) : Text(""),
            ),
          ],
        ),
      ),
    );
  }

  _onWidgetTap() async {
    if (widget.uri == null) {
      return;
    }
    if (await canLaunch(widget.uri)) {
    await launch(widget.uri);
    } else {
    throw 'Could not launch $widget.uri';
    }
  }

}
