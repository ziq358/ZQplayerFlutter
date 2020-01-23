// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiveItem _$LiveItemFromJson(Map<String, dynamic> json) {
  return LiveItem(
    json['enable'] as String,
    json['game_type'] as String,
    json['live_id'] as String,
    json['live_img'] as String,
    json['live_name'] as String,
    json['live_nickname'] as String,
    json['live_online'] as String,
    json['live_title'] as String,
    json['live_type'] as String,
    json['live_userimg'] as String,
    json['show_type'] as String,
  );
}

Map<String, dynamic> _$LiveItemToJson(LiveItem instance) => <String, dynamic>{
      'enable': instance.enable,
      'game_type': instance.gameType,
      'live_id': instance.liveId,
      'live_img': instance.liveImg,
      'live_name': instance.liveName,
      'live_nickname': instance.liveNickname,
      'live_online': instance.liveOnline,
      'live_title': instance.liveTitle,
      'live_type': instance.liveType,
      'live_userimg': instance.liveUserimg,
      'show_type': instance.showType,
    };
