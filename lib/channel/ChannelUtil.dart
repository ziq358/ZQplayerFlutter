import 'package:flutter/services.dart';

const platform = SystemChannels.platform;

onBackPressed() async {
  try {
    //SystemNavigator.pop 会调用android 的activity finished
    final String result = await platform.invokeMethod('SystemNavigator.pop');
    print(result);
  } on PlatformException catch (e) {}
}
