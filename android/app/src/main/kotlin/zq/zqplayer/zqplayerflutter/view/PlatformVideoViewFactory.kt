package zq.zqplayer.zqplayerflutter.view

import android.content.Context
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.BinaryMessenger
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
            fun registerWith(flutterEngine: FlutterEngine): Unit {
                //兼容写法
//                val key: String? = FluttertoAndroidVideoViewPlugin::class.java.canonicalName
//                val shimPluginRegistry = ShimPluginRegistry(flutterEngine)
//                if (shimPluginRegistry.hasPlugin(key)) return;
//                val registrar: PluginRegistry.Registrar = shimPluginRegistry.registrarFor(key);
//                registrar.platformViewRegistry().registerViewFactory("zqvideoview", PlatformVideoViewFactory(registrar.messenger()));
                // 1.12 后写法
                val registry = flutterEngine.platformViewsController.registry
                registry.registerViewFactory("zqvideoview", PlatformVideoViewFactory(flutterEngine.dartExecutor))
            }
        }
    }
}