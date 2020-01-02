import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse extends Object {
  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'timestamp')
  int timestamp;

  @JsonKey(name: 'data')
  dynamic data;

  BaseResponse(this.code, this.msg, this.timestamp, this.data);

  factory BaseResponse.fromJson(Map<String, dynamic> srcJson) =>
      _$BaseResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}
