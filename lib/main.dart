import 'package:flutter/material.dart';
import 'package:zqplayerflutter/route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'zqplayer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home: MainBottomTabPage(),
      initialRoute: '/main',
      routes: routes,
    );
  }
}


