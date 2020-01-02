// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) {
  return BaseResponse(
    json['code'] as int,
    json['msg'] as String,
    json['timestamp'] as int,
    json['data'],
  );
}

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'timestamp': instance.timestamp,
      'data': instance.data,
    };
