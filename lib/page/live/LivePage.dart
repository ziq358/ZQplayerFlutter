import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LivePage extends StatefulWidget {
  String title;
  String url;

  LivePage(this.title, this.url, {Key key}) : super(key: key);

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<LivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: new AspectRatio(
      aspectRatio: 16 / 9,
      child: AndroidView(
          viewType: "zqvideoview",
          creationParams: {"title": widget.title, "url": widget.url},
          creationParamsCodec: const StandardMessageCodec()),
    )));
  }
}
