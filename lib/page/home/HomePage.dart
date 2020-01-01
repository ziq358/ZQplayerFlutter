import 'package:flutter/material.dart';
import 'package:zqplayerflutter/common/widgets/LoadingWidget.dart';
import 'package:zqplayerflutter/utils/NetUtil.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<HomePage> {
  
  @override
  void initState() {
    // TODO: implement initState
    NetUtil.get("/live/list", {"offset":0,"limit":20,"game_type":"ow"}).then((res){
      print("home ::::  ");
      print(res);
    }).catchError((e) {
      print(e);
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              height: 300.0,
              width: 300.0,
              color: Colors.red,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      width: 100.0,
                      color: Colors.blue,
                    )
                  ])),
        ]);
  }

}
