import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  MinePage({Key key}) : super(key: key);

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'MinePage',
      )),
    );
  }
}
