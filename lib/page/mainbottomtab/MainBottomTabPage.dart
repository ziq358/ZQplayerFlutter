import 'package:flutter/material.dart';
import 'package:zqplayerflutter/page/amusement/AmusementPage.dart';
import 'package:zqplayerflutter/page/discovery/DiscoveryPage.dart';
import 'package:zqplayerflutter/page/home/HomePage.dart';
import 'package:zqplayerflutter/page/mine/MinePage.dart';
import 'package:zqplayerflutter/page/subscribe/SubscribePage.dart';

class MainBottomTabPage extends StatefulWidget {
  MainBottomTabPage({Key key}) : super(key: key);

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<MainBottomTabPage> {
  int _currentIndex = 0;
  PageController _pageController = new PageController();

  final pages = [
    HomePage(),
    AmusementPage(),
    SubscribePage(),
    DiscoveryPage(),
    MinePage()
  ];

  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      backgroundColor: Colors.blue,
      icon: Icon(Icons.home),
      title: Text("首页"),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.green,
      icon: Icon(Icons.stars),
      title: Text("娱乐"),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.amber,
      icon: Icon(Icons.collections),
      title: Text("订阅"),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.red,
      icon: Icon(Icons.find_replace),
      title: Text("发现"),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.teal,
      icon: Icon(Icons.person),
      title: Text("我的"),
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavItems,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        onTap: (index) {
          if (index != _currentIndex) {
            _pageController.jumpToPage(index);
          }
        },
      ),
      body: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) => pages[index],
        onPageChanged: (index) {
          if (index != _currentIndex) {
            setState(() {
              _currentIndex = index;
            });
          }
        },
      ),
    );
  }

}
