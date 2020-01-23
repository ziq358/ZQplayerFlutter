import 'package:flutter/material.dart';
import 'package:zqplayerflutter/common/model/home/live_item.dart';
import 'package:zqplayerflutter/common/widgets/home/LiveCard.dart';
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
    print("home page initstate");
    NetUtil.post("/live/list", {"offset": 0, "limit": 40, "game_type": "ow"})
        .then((response) {
      setState(() {
        list = getLiveItemList(response.data);
      });
    }).catchError((e) {
      print(e);
    });
    super.initState();
  }

  List<LiveItem> list = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //横轴元素个数
                  crossAxisCount: 2,
                  //纵轴间距
                  mainAxisSpacing: 0.0,
                  //横轴间距
                  crossAxisSpacing: 0.0,
                  //子组件宽高长度比例
                  childAspectRatio: 4 / 3
              ),
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return LiveCard(list[index], () {
                  print("tab");
                });
              }
          )
      ), //
    );
  }

}
