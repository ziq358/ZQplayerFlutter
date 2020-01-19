import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zqplayerflutter/page/home/model/live_item.dart';

class LiveCard extends StatelessWidget {
  LiveCard(this.model);

  final LiveItem model;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: EdgeInsets.all(5.0),
      child: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16 / 9,
            child: new CachedNetworkImage(
                fit: BoxFit.fill, imageUrl: model.liveImg),
          ),
          Text(
            "${model.liveTitle}",
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    ));
  }
}
