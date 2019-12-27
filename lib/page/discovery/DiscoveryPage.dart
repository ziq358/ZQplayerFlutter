import 'package:flutter/material.dart';

class DiscoveryPage extends StatefulWidget {
  DiscoveryPage({Key key}) : super(key: key);

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<DiscoveryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'DiscoveryPage',
      )),
    );
  }
}
