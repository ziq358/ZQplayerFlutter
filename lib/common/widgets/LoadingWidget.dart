import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget {
  static Widget create({@required Widget child,
    bool loading = true,
    Color bgColor,
    Color loadingBgColor,
    VoidCallback onTap}) {
    return Stack(
      children: <Widget>[
        child,
        Offstage(
          child: getFrontBody(
              onTap: onTap, bgColor: bgColor, loadingBgColor: loadingBgColor),
          offstage: !loading, //offstage:true, 隐藏
        )
      ],
    );
  }

  static Widget getFrontBody(
      {VoidCallback onTap, Color bgColor, Color loadingBgColor}) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        alignment: AlignmentDirectional.center, //居中
        decoration: new BoxDecoration(
          color: bgColor == null ? Color(0x809E9E9E) : bgColor,
        ),
        child: new Container(
          decoration: new BoxDecoration(
              color: loadingBgColor == null ? Colors.white : loadingBgColor,
              borderRadius: new BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Color(0xCC9E9E9E),
                  blurRadius: 5.0,
                ),
              ]),
          width: 70.0,
          height: 70.0,
          alignment: AlignmentDirectional.center,
          child: SizedBox(
            //能强制子控件具有特定宽度、高度或两者都有,使子控件设置的宽高失效
            height: 25.0,
            width: 25.0,
            child: CupertinoActivityIndicator(
              radius: 15.0,
            ),
          ),
        ),
      ),
    );
  }
}
