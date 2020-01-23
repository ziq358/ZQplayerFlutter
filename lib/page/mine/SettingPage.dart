import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zqplayerflutter/channel/ChannelUtil.dart';
import 'package:zqplayerflutter/page/mine/UserInfoPage.dart';
import 'package:zqplayerflutter/utils/ColorUtil.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingRootState createState() => _SettingRootState();
}

class _SettingRootState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hexToColor("#F8F8F8"),
      appBar: AppBar(
        leading: BackButton(onPressed: () {
          onBackPressed();
        }),
        title: Text('设置'),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 0),
        children: <Widget>[
          bottomMenuItem("个人资料", () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => UserInfoPage(),
            ));
          }),
          bottomMenuItem("绑定手机", () {}),
          bottomMenuItem("支付密码", () {}),
          bottomMenuItem("实名认证", () {}),
          bottomMenuItem("关于我们", () {
            print("关于我们");
          }),
          Container(
            height: 5,
            color: hexToColor("#F8F8F8"),
          ),
          Container(
              color: Colors.white,
              alignment: Alignment.center,
              height: 50,
              child: Text("退出登录",
                  style: TextStyle(
                    color: hexToColor("#292929"),
                    fontSize: 14.0,
                  ))),
        ],
      ),
    );
  }

  Widget bottomMenuItem(String menuName, Function callback) {
    return Material(
      color: Colors.white,
      child: Ink(
        child: InkWell(
          onTap: () {
            callback();
          },
          child: Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: hexToColor("#EFEFEF")))),
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
        ),
      ),
    );
  }
}
