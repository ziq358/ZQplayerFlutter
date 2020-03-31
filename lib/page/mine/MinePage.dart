import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zqplayerflutter/channel/ChannelUtil.dart';
import 'package:zqplayerflutter/page/test/TestListPage.dart';
import 'package:zqplayerflutter/utils/ColorUtil.dart';

const avatar_test =
    "http://a.hiphotos.baidu.com/zhidao/pic/item/5243fbf2b21193131848738461380cd791238dff.jpg";

class MinePage extends StatefulWidget {
  @override
  _MineRootState createState() => _MineRootState();
}

class _MineRootState extends State<MinePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    print("MinePage init");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Stack(children: <Widget>[
            Padding(
                padding: EdgeInsets.only(bottom: 47.5),
                child: Container(
                  padding: EdgeInsets.only(bottom: 61),
                  decoration: BoxDecoration(color: Colors.teal
//                      image: new DecorationImage(
//                        image: new AssetImage('images/mine_top_bg.png'),
//                        fit: BoxFit.fill,
//                      )
                  ),
                  child: SafeArea(
                      child: Padding(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "我的",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ],
                              ),
                              userInfoItem(() {}),
                              Column(
                                children: <Widget>[
                                  Text("账户余额",
                                      style: TextStyle(
                                        color: hexToColor("#FFB3AE"),
                                        fontSize: 12.0,
                                      )),
                                  Text("¥0",
                                      style: TextStyle(
                                        color: hexToColor("#FFFFFF"),
                                        fontSize: 18.0,
                                      ))
                                ],
                              )
                            ],
                          ))),
                )),
            Positioned(
                left: 15,
                right: 15,
                bottom: 0,
                child: Container(
                  height: 84,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Color.fromARGB(25, 0, 0, 0),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 1.5))
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      topMenuItem(
                          10,
                          0,
                          10,
                          0,
                          Icons.favorite,
                          "我的订阅", () {}),
                      topMenuItem(
                          0,
                          0,
                          0,
                          0,
                          Icons.people,
                          "我的粉丝", () {}),
                      topMenuItem(
                          0,
                          0,
                          0,
                          0,
                          Icons.timer,
                          "我看过的", () {}),
                      topMenuItem(
                          0,
                          10,
                          0,
                          10,
                          Icons.featured_play_list,
                          "我下单的", () {}),
                    ],
                  ),
                ))
          ]),
          Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 8),
                child: ListView(
                  padding: EdgeInsets.only(top: 0),
                  children: <Widget>[
                    bottomMenuItem("设置", () {
                      onSettingTap();
                    }),
                    bottomMenuItem("test", () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return TestListPage();
                          }));
                    }),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  /// 布局
  Widget userInfoItem(Function callback) {
    return GestureDetector(
      onTap: () {
        callback();
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 25.5, 0, 22.5),
        child: Row(
          children: <Widget>[
            ClipOval(
              child: CachedNetworkImage(
                  width: 56,
                  height: 56,
                  imageUrl: avatar_test,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                  new Image(
                    image: AssetImage('images/avatar_placeholder.png'),
                    fit: BoxFit.cover,
                  ),
                  errorWidget: (context, url, error) =>
                  new Image(
                    image: AssetImage('images/avatar_placeholder.png'),
                    fit: BoxFit.cover,
                  )),
            ),
            Expanded(
                child: Container(
              height: 56,
              padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                  child: Text(
                    "tianshang22",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19.0,
                    ),
                  ),
            )),
            Image(
              image: AssetImage('images/white_right_arrow.png'),
              width: 20.0,
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget topMenuItem(double radiusTopLeft,
      double radiusTopRight,
      double radiusBottomLeft,
      double radiusBottomRight,
      IconData icon,
      String menuName,
      Function callback,) {
    return Expanded(
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radiusTopLeft),
              topRight: Radius.circular(radiusTopRight),
              bottomLeft: Radius.circular(radiusBottomLeft),
              bottomRight: Radius.circular(radiusBottomRight)),
          child: Ink(
            child: InkWell(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radiusTopLeft),
                  topRight: Radius.circular(radiusTopRight),
                  bottomLeft: Radius.circular(radiusBottomLeft),
                  bottomRight: Radius.circular(radiusBottomRight)),
              onTap: () {
                callback();
              },
              child: Container(
                padding: EdgeInsets.only(top: 15),
                child: Column(
                  children: <Widget>[
                    Icon(
                      icon,
                      size: 30.0,
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(menuName,
                            style: TextStyle(
                              color: hexToColor("#292929"),
                              fontSize: 11.0,
                            )))
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget bottomMenuItem(String menuName, Function callback) {
    return InkWell(
      onTap: () {
        callback();
      },
      child: Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: hexToColor("#EFEFEF")))),
          height: 50,
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Text(menuName,
                      style: TextStyle(
                        color: hexToColor("#292929"),
                        fontSize: 14.0,
                      ))),
              Image(
                image: AssetImage("images/black_arrow_right.png"),
                width: 10.0,
                height: 10.0,
              ),
            ],
          )),
    );
  }
}
