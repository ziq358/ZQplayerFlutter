package zq.zqplayer.zqplayerflutter.view

import android.content.Context
import android.view.View
import android.widget.Toast
import com.zq.playerlib.ZQVideoView
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.platform.PlatformView

/**
 *    author : wuyanqiang
 *    date   : 2020-01-31
 *    desc   :
 */
class PlatformVideoView : PlatformView {
    var mZQVideoView: ZQVideoView? = null;

    constructor(context: Context, messenger: BinaryMessenger, id: Int, params: Map<String, Object>) {
        mZQVideoView = ZQVideoView(context)
        if (params.isNotEmpty() && params.containsKey("url")) {
            val title: String = params["title"].toString();
            val url: String = params["url"].toString();
            initVideoView(context, title, url);
        }
    }

    fun initVideoView(context: Context, title: String, videoPath: String) {
        mZQVideoView?.setTitle(title)
        mZQVideoView?.setVideoPath(videoPath)
        mZQVideoView?.setActionListener(object : ZQVideoView.OnActionListener {
            override fun onLoading() {
            }

            override fun onPrepareFinished() {
                mZQVideoView?.play()
            }

            override fun onClick() {
                if (mZQVideoView?.isMenuShowed()!!) {
                    mZQVideoView?.hideController()
                } else {
                    mZQVideoView?.showController()
                }
            }

            override fun onPlayClick() {
                if (mZQVideoView?.isPlaying()!!) {
                    mZQVideoView?.pause()
                } else {
                    mZQVideoView?.play()
                }
            }

            override fun onBackClick() {
                Toast.makeText(context, "onBackClick", Toast.LENGTH_SHORT).show()

            }

            override fun onClarityClick() {
                Toast.makeText(context, "onClarityClick", Toast.LENGTH_SHORT).show()
            }

            override fun onSettingClick() {
                Toast.makeText(context, "onSettingClick", Toast.LENGTH_SHORT).show()
            }

            override fun onShareClick() {
            }

            override fun onBarrageClick() {
                Toast.makeText(context, "onBarrageClick", Toast.LENGTH_SHORT).show()
            }

            override fun onStarClick() {
                Toast.makeText(context, "onStarClick", Toast.LENGTH_SHORT).show()
            }

            override fun onFullScreenClick() {
                Toast.makeText(context, "onFullScreenClick", Toast.LENGTH_SHORT).show()
            }
        })
    }

    override fun getView(): View {
        return mZQVideoView!!
    }

    override fun dispose() {
        if (mZQVideoView?.isPlaying()!!) {
            mZQVideoView?.showFloatingWindow()
        }
    }
}