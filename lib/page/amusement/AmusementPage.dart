import 'package:flutter/material.dart';

class AmusementPage extends StatefulWidget {
  AmusementPage({Key key}) : super(key: key);

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<AmusementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'AmusementPage',
      )),
    );
  }
}
