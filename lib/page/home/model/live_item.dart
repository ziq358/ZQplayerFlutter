import 'package:json_annotation/json_annotation.dart';

part 'live_item.g.dart';

List<LiveItem> getLiveItemList(List<dynamic> list) {
  List<LiveItem> result = [];
  list.forEach((item) {
    result.add(LiveItem.fromJson(item));
  });
  return result;
}

@JsonSerializable()
class LiveItem extends Object {
  @JsonKey(name: 'enable')
  String enable;

  @JsonKey(name: 'game_type')
  String gameType;

  @JsonKey(name: 'live_id')
  String liveId;

  @JsonKey(name: 'live_img')
  String liveImg;

  @JsonKey(name: 'live_name')
  String liveName;

  @JsonKey(name: 'live_nickname')
  String liveNickname;

  @JsonKey(name: 'live_online')
  String liveOnline;

  @JsonKey(name: 'live_title')
  String liveTitle;

  @JsonKey(name: 'live_type')
  String liveType;

  @JsonKey(name: 'live_userimg')
  String liveUserimg;

  @JsonKey(name: 'show_type')
  String showType;

  LiveItem(
    this.enable,
    this.gameType,
    this.liveId,
    this.liveImg,
    this.liveName,
    this.liveNickname,
    this.liveOnline,
    this.liveTitle,
    this.liveType,
    this.liveUserimg,
    this.showType,
  );

  factory LiveItem.fromJson(Map<String, dynamic> srcJson) =>
      _$LiveItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LiveItemToJson(this);
}
