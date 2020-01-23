import 'package:flutter/material.dart';
import 'package:zqplayerflutter/channel/ChannelPage.dart';
import 'package:zqplayerflutter/page/mainbottomtab/MainBottomTabPage.dart';

const pageMainBottomTab = Navigator.defaultRouteName;

final Map<String, WidgetBuilder> routes = {
  '/channelPage': (context) => ChannelPage(),
  '/main': (context) => MainBottomTabPage(),
};
