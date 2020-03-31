import 'package:flutter/services.dart';

const platform = SystemChannels.platform;

onBackPressed() async {
  try {
    //SystemNavigator.pop 会调用android 的activity finished
    final String result = await platform.invokeMethod('SystemNavigator.pop');
    print(result);
  } on PlatformException catch (e) {}
}

onSettingTap() async {
  try {
    final String result =
    await platform.invokeMethod('openSettingPage', <String, dynamic>{
      'title': "title111",
      'url': "url222",
    });
    print(result);
  } on PlatformException catch (e) {}
}
