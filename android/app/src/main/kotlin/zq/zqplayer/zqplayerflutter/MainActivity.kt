package zq.zqplayer.zqplayerflutter

import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES
import android.os.Bundle
import android.util.Log
import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant


class MainActivity: FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)
        var methodChannel = MethodChannel(flutterView, "flutter/main")
        methodChannel.setMethodCallHandler { call, result ->
            when (call.method) {
                "openSettingPage" -> {
                    startActivity(Intent(this@MainActivity, SettingActivity::class.java))
                    result.success("打开settingPage")
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

}
