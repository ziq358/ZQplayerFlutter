import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zqplayerflutter/page/mine/SettingPage.dart';

import 'ChannelUtil.dart';

class ChannelPage extends StatefulWidget {
  @override
  _ChannelPageState createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
  String route = "";

  @override
  void initState() {
    super.initState();
    initChannel();
  }

  void initChannel() {
    platform.setMethodCallHandler((methodCall) {
      return Future(() {
        String result = "没有匹配的路由";
        switch (methodCall.method) {
          case "initRoute":
            String args = methodCall.arguments;
            setState(() {
              route = args;
            });
            result = "initRoute成功";
        }
        return result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return getBodyByRoute();
  }

  Widget getBodyByRoute() {
    Widget resultWidget = Container();
    switch (route) {
      case "/settingPage":
        resultWidget = SettingPage();
        break;
    }
    return resultWidget;
  }
}
