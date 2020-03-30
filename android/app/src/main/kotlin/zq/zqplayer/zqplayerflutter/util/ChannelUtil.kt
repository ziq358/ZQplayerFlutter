package com.gdinke.alstore.util

import android.content.Context
import android.content.Intent
import io.flutter.embedding.engine.FlutterEngine
import zq.zqplayer.zqplayerflutter.SettingActivity

/**
 *    author : wuyanqiang
 *    date   : 2020-03-10
 *    desc   :
 */
class ChannelUtil {
    var context: Context? = null

    constructor(context: Context, flutterEngine: FlutterEngine) {
        this.context = context
        flutterEngine.platformChannel.channel.setMethodCallHandler { call, result ->
            when (call.method) {
                "openSettingPage" -> {
                    var title: String? = call.argument("title")
                    var url: String? = call.argument("url")
                    println(title)
                    println(url)
                    this.context!!.startActivity(
                            Intent(this.context!!, SettingActivity::class.java)
                                    .setFlags(Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_EXCLUDE_FROM_RECENTS)
                    )
                    result.success("打开settingPage")
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }
}