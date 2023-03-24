package ca.bc.gov.image_picker

import android.annotation.SuppressLint
import android.app.Activity
import android.content.ClipData
import android.content.Intent
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.net.Uri
import ca.bc.gov.image_picker.constants.Definitions
import ca.bc.gov.image_picker.constants.PermissionType
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry
import java.io.ByteArrayOutputStream
import java.lang.Integer.min
import kotlin.math.max


/** ImagePickerPlugin */
class ImagePickerPlugin : FlutterPlugin, MethodCallHandler, PluginRegistry.ActivityResultListener, ActivityAware {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private var activity: Activity? = null
    private var result: Result? = null
    private var smallSideCompress: Int? = null

    companion object {
        const val PICK_IMAGE = 33
    }


    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, Definitions.methodChannel)
        channel.setMethodCallHandler(this)
    }


    @SuppressLint("IntentReset")
    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            Definitions.pickImageMethod -> {
                this.result = result
                this.smallSideCompress = call.argument<Int?>(Definitions.smallSideCompressParam)
                activity?.run {
                    val intent = Intent()
                    intent.type = "image/*"
                    intent.action = Intent.ACTION_GET_CONTENT
                    intent.putExtra(Intent.EXTRA_ALLOW_MULTIPLE, true)
                    startActivityForResult(Intent.createChooser(intent, "Select Picture"), PICK_IMAGE)
                }
            }
            else -> result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        if (requestCode == PICK_IMAGE) {
            val contentResolver = activity?.contentResolver ?: return run {
                result?.success(mapOf(
                    Definitions.permissionParam to PermissionType.granted.value,
                ))
                true
            }
            if (data?.data != null) {
                val inputStream = data.data?.let { contentResolver.openInputStream(it) }
                result?.success(mapOf(
                    Definitions.imagesParam to listOf(inputStream?.readBytes()?.compress(smallSideCompress)),
                    Definitions.permissionParam to PermissionType.granted.value,
                ))
                inputStream?.close()
            } else {
                val clipData = data?.clipData ?: return run {
                    result?.success(mapOf(
                        Definitions.permissionParam to PermissionType.granted.value,
                    ))
                    true
                }
                val images: ArrayList<ByteArray> = ArrayList()
                for (i in 0 until clipData.itemCount) {
                    val item: ClipData.Item = clipData.getItemAt(i)
                    val uri: Uri = item.uri
                    // Get the cursor
                    contentResolver.openInputStream(uri)?.run {
                        images.add(readBytes().compress(smallSideCompress))
                        close()
                    }
                }
                result?.success(mapOf(
                    Definitions.imagesParam to images,
                    Definitions.permissionParam to PermissionType.granted.value,
                ))
            }
            return true
        }
        return false
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
        binding.addActivityResultListener(this)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activity = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity
        binding.addActivityResultListener(this)
    }

    override fun onDetachedFromActivity() {
        activity = null
    }

}

fun ByteArray.compress(smallSideCompress: Int?) = smallSideCompress?.takeIf { it > 0 }?.let {
    val bitmap = BitmapFactory.decodeByteArray(this, 0, size)
    val scaleFactor = 1.0 / max(1.0, min(bitmap.width, bitmap.height) / smallSideCompress.toDouble())
    val compressedBitmap = Bitmap.createScaledBitmap(bitmap,
        (bitmap.width * scaleFactor).toInt(), (bitmap.height * scaleFactor).toInt(), false)
    val stream = ByteArrayOutputStream()
    compressedBitmap.compress(Bitmap.CompressFormat.JPEG, 100, stream)
    stream.toByteArray()
} ?: this
