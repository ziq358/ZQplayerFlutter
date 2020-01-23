package zq.zqplayer.zqplayerflutter.test

import android.os.Bundle
import android.support.v4.app.FragmentActivity
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.FrameLayout
import io.flutter.embedding.android.FlutterFragment
import io.flutter.plugin.common.MethodChannel
import zq.zqplayer.zqplayerflutter.R


/**
 *    author : wuyanqiang
 *    date   : 2020-01-20GeneratedPluginRegistrant
 *    desc   :
 */
class TestActivity : FragmentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.test_activity)
//        val frFlutter:FrameLayout = findViewById(R.id.flutter_container);
//        var flutterEngine = FlutterEngine(this)
//        flutterEngine.navigationChannel.setInitialRoute("/")
//        flutterEngine.dartExecutor.executeDartEntrypoint(
//                DartEntrypoint.createDefault()
//        )
//        val flutterView: FlutterView =  FlutterView(this);
//        var layout = FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
//        flutterView.attachToFlutterEngine(flutterEngine);
//        frFlutter.addView(flutterView, layout);
        val fragmentManager = supportFragmentManager
        var flutterFragment = FlutterFragment.NewEngineFragmentBuilder()
                .initialRoute("/channelPage")
                .build<FlutterFragment>();
        fragmentManager
                .beginTransaction()
                .add(R.id.flutter_container,
                        flutterFragment,
                        "FlutterFragment"
                )
                .commit();
        findViewById<Button>(R.id.btn).setOnClickListener(object : View.OnClickListener {
            override fun onClick(p0: View?) {
                flutterFragment.flutterEngine?.platformChannel?.channel?.invokeMethod(
                        "initRoute", "/test", object : MethodChannel.Result {
                    override fun notImplemented() {
                        println("notImplemented")
                    }

                    override fun error(errorCode: String?, errorMessage: String?, errorDetails: Any?) {
                        println("error")
                    }

                    override fun success(result: Any?) {
                        println(result)
                    }

                })
            }

        })


    }
}