import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zqplayerflutter/common/model/home/live_item.dart';
import 'package:zqplayerflutter/common/widgets/LoadingWidget.dart';
import 'package:zqplayerflutter/common/widgets/home/LiveCard.dart';
import 'package:zqplayerflutter/page/live/LivePage.dart';
import 'package:zqplayerflutter/utils/NetUtil.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);


  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<HomePage> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  List<LiveItem> list = List();
  bool isLoading = true;

  @override
  void initState() {
    NetUtil.post("/live/list", {"offset": 0, "limit": 40, "game_type": "ow"})
        .then((response) {
      if (mounted) {
        setState(() {
          isLoading = false;
          list = getLiveItemList(response.data);
        });
      }
    }).catchError((e) {
      print(e);
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingWidget.create(
        loading: isLoading,
        onTap: () {
          setState(() {
            isLoading = false;
          });
        },
        child: SafeArea(
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
                  return LiveCard(list[index], (model) {
                    onLiveTap(model);
                  });
                }
            )
        ),
      ), //
    );
  }

  static const platform = const MethodChannel('flutter/main');

  onLiveTap(LiveItem model) async {
    if (mounted) {
      setState(() {
        isLoading = true;
      });
    }
    NetUtil.post("/live/list/item", {
      "live_id": model.liveId,
      "live_type": model.liveType,
      "game_type": model.gameType
    }).then((response) async {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
        String title = response.data['live_title'];
        List stream = response.data['stream_list'];
        if (stream != null && stream.length > 0) {
          String url = stream[0]['url'];
          Navigator.of(context).push(MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) {
                return LivePage(title, url);
              }));
        } else {
          Fluttertoast.showToast(msg: '没有直播地址', gravity: ToastGravity.BOTTOM);
        }
      }
    }).catchError((e) {
      print(e);
    });
  }

}
