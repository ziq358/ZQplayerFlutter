import 'dart:convert' as Convert;

import 'package:dio/dio.dart';
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

  static Future<Map> _request(String method, String url, {data}) async {
    data = data ?? {};
    print('网络请求参数：');
    print(method);
    print(url);
    print(data);
    var response = await getDioInstance().request(url, data: data, options: new Options(method:method));
    print('网络返回结果：');
    print(response);
    var res = response.data;
    return res;
  }

  /// get
  static Future<Map> get(url, data) => _request("post", url, data: data);

  /// post
  static Future<Map> post(url, data) => _request( "post", url, data: data);
}