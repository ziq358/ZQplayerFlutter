package zq.zqplayer.zqplayerflutter

import android.content.Intent
import android.os.Bundle
import android.support.v4.app.Fragment
import android.support.v4.app.FragmentActivity
import android.view.View
import android.widget.Button
import io.flutter.embedding.android.FlutterFragment
import io.flutter.plugin.common.MethodChannel

/**
 *    author : wuyanqiang
 *    date   : 2020-01-22
 *    desc   :
 */
class SettingActivity : FragmentActivity() {

    var flutterFragment: FlutterFragment? = null;

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.setting_activity)
        val fragmentManager = supportFragmentManager
        flutterFragment = FlutterFragment.NewEngineFragmentBuilder()
                .initialRoute("/channelPage")
                .build<FlutterFragment>();
        fragmentManager
                .beginTransaction()
                .add(R.id.flutter_container, flutterFragment!!, "FlutterFragment")
                .commit();
        findViewById<View>(R.id.flutter_container).post(object : Runnable {
            override fun run() {
                flutterFragment!!.flutterEngine?.platformChannel?.channel?.invokeMethod(
                        "initRoute", "/settingPage", object : MethodChannel.Result {
                    override fun notImplemented() {
                    }

                    override fun error(errorCode: String?, errorMessage: String?, errorDetails: Any?) {
                    }

                    override fun success(result: Any?) {
                    }

                });
            }
        })
    }

    override fun onBackPressed() {
        flutterFragment?.onBackPressed()
    }

}