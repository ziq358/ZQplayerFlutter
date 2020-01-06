import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zqplayerflutter/page/home/model/live_item.dart';
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
    NetUtil.post("/live/list", {"offset": 0, "limit": 20, "game_type": "ow"})
        .then((response) {
      setState(() {
        list = getLiveItemList(response.data);
      });
    }).catchError((e) {
      print(e);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _getBody()), //
    );
  }

  List<LiveItem> list = List();

  Widget _getBody() {
    return new ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return _getLiveItem(list[index]);
      },
      itemCount: list.length,
    );
  }

  Widget _getLiveItem(LiveItem item) {
    return Padding(padding: EdgeInsets.all(10.0),
      child: Column(children: <Widget>[
//        Image.network(item.liveImg),
        new CachedNetworkImage(imageUrl: item.liveImg),
        Text("${item.liveTitle}")
      ],),
    );
  }

}
