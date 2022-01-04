package com.example.lock_orientation

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import android.content.Context;
import android.content.res.Configuration;
import android.view.Surface;
import android.view.WindowManager;


/** LockOrientationPlugin */
class LockOrientationPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private lateinit var context: Context

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "lock_orientation")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.getApplicationContext()
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "getOrientation") {
            var rotation = (context.getSystemService(Context.WINDOW_SERVICE) as WindowManager).getDefaultDisplay().getRotation()
            var orientation = context.getResources().getConfiguration().orientation;
//      result.success("up")
            when (orientation) {
                Configuration.ORIENTATION_PORTRAIT -> if (rotation === Surface.ROTATION_0 || rotation === Surface.ROTATION_90) {
//          returnOrientation = Orientation.PortraitUp
                    result.success("up")
                } else {
//          returnOrientation = Orientation.PortraitDown
                    result.success("down")
                }
                Configuration.ORIENTATION_LANDSCAPE -> if (rotation === Surface.ROTATION_0 || rotation === Surface.ROTATION_90) {
//          returnOrientation = Orientation.LandscapeLeft
                    result.success("left")
                } else {
//          returnOrientation = Orientation.LandscapeRight
                    result.success("right")
                }
                else -> result.success("null")
            }
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
