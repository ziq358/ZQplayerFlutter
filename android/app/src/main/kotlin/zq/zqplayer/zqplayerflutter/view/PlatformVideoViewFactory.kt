package zq.zqplayer.zqplayerflutter.view

import android.content.Context
import android.content.Intent
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

/**
 *    author : wuyanqiang
 *    date   : 2020-01-31
 *    desc   :
 */
class PlatformVideoViewFactory : PlatformViewFactory {
    var messenger: BinaryMessenger? = null;

    constructor(messenger: BinaryMessenger) : super(StandardMessageCodec.INSTANCE) {
        this.messenger = messenger
    }

    override fun create(context: Context?, viewId: Int, args: Any?): PlatformView {
        //flutter 传递过来的参数
        var params: Map<String, Object> = args as Map<String, Object>;
        //创建 TestTextView
        return PlatformVideoView(context!!, messenger!!, viewId, params);
    }


    class FluttertoAndroidVideoViewPlugin {

        companion object {
            fun registerWith(registry: PluginRegistry): Unit {
                val key: String? = FluttertoAndroidVideoViewPlugin::class.java.canonicalName
                if (registry.hasPlugin(key)) return;
                val registrar: PluginRegistry.Registrar = registry.registrarFor(key);
                registrar.platformViewRegistry().registerViewFactory("zqvideoview", PlatformVideoViewFactory(registrar.messenger()));
            }
        }
    }
}