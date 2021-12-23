package app.flutter_app_quiz_game

import android.os.Build
import android.os.Bundle
import android.view.View
import android.view.Window
import android.view.WindowManager
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity : FlutterActivity() {

    private val CHANNEL = "main.flutter"

    override fun onCreate(savedInstanceState: Bundle?) {
        setWindowAttrs()
        super.onCreate(savedInstanceState)
    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            if (call.method == "getAppTitle") {
                result.success(getAppTitle())
            } else if (call.method == "getAppKey") {
                result.success(getAppKey())
            } else if (call.method == "isPro") {
                result.success(isPro())
            } else if (call.method == "getAdBannerId") {
                result.success(getAdBannerId())
            } else if (call.method == "getAdInterstitialId") {
                result.success(getAdInterstitialId())
            } else if (call.method == "getAdRewardedId") {
                result.success(getAdRewardedId())
            } else if (call.method == "getLanguageCode") {
                result.success(getLanguageCode())
            }
        }
    }

    private fun setWindowAttrs() {
        val decorView = window.decorView
        val uiOptions = View.SYSTEM_UI_FLAG_FULLSCREEN
        decorView.systemUiVisibility = uiOptions
        window.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
        requestWindowFeature(Window.FEATURE_NO_TITLE)
    }

    private fun getLanguageCode(): String {
        return resources.getString(R.string.language)
    }

    private fun getAdBannerId(): String {
        return resources.getString(R.string.admob_banner_id)
    }

    private fun getAdInterstitialId(): String {
        return resources.getString(R.string.admob_inter_id)
    }

    private fun getAdRewardedId(): String {
        return resources.getString(R.string.admob_video_id)
    }

    private fun getAppTitle(): String {
        return resources.getString(R.string.app_name)
    }

    private fun getAppKey(): String {
        return resources.getString(R.string.game_id)
    }

    private fun isPro(): Boolean {
        return resources.getBoolean(R.bool.is_pro)
    }
}
