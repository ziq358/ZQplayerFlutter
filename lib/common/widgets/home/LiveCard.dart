import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zqplayerflutter/common/model/home/live_item.dart';

class LiveCard extends StatelessWidget {
  LiveCard(this.model, this.onTap);

  final LiveItem model;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(this.model);
      },
      child: Container(
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 16 / 9,
//                  child: Image.network(model.liveImg),
                  child: new CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: model.liveImg,
                      placeholder: (context, url) =>
                      new Image(
                        image: AssetImage('images/black_arrow_right.png'),
                        fit: BoxFit.cover,
                      ),
                      errorWidget: (context, url, error) =>
                      new Image(
                        image: AssetImage('images/avatar_placeholder.png'),
                        fit: BoxFit.cover,
                      )),
                ),
                Text(
                  "${model.liveTitle}",
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          )),
    );
  }
}
