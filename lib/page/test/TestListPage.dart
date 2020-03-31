import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zqplayerflutter/page/test/demo/BlowSandPage.dart';
import 'package:zqplayerflutter/utils/ColorUtil.dart';

class TestListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('实验列表'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            bottomMenuItem("灭霸吹灰效果", () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return BlowSandPage();
              }));
            }),
          ],
        ),
      ),
    );
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
