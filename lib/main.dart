import 'package:flutter/material.dart';
import 'package:zqplayerflutter/route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home: MainBottomTabPage(),
//      initialRoute: "/home",
      routes: routes,
    );
  }
}


