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
        // createLayout()
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
            }
        }
    }

    private fun setWindowAttrs() {
        window.decorView.systemUiVisibility = View.SYSTEM_UI_FLAG_FULLSCREEN
        window.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
        requestWindowFeature(Window.FEATURE_NO_TITLE)
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
