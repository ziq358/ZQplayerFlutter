import 'package:dio/dio.dart';
import 'package:zqplayerflutter/common/model/base_response.dart';
import 'package:zqplayerflutter/config/net/NetConfig.dart';

class NetUtil {
  static Dio dio;
  static Dio getDioInstance(){
    if(dio == null){
      BaseOptions options = new BaseOptions(
        baseUrl: NetConfig.baseUrl,
        connectTimeout: NetConfig.connectTimeout,
        receiveTimeout: NetConfig.receiveTimeout,
      );
      dio = new Dio(options);
    }
    return dio;
  }

  static Future<BaseResponse> _request(String method, String url,
      {data}) async {
    data = data ?? {};
    print('网络请求参数：');
    print(method);
    print(url);
    print(data);
    var response = await getDioInstance().request(url, data: data, options: new Options(method:method));
    print('网络返回结果：');
    print(response);
    return BaseResponse.fromJson(response.data);
  }

  /// get
  static Future<BaseResponse> get(url, data) =>
      _request("post", url, data: data);

  /// post
  static Future<BaseResponse> post(url, data) =>
      _request("post", url, data: data);
}