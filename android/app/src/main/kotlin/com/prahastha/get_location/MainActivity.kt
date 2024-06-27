package com.prahastha.get_location
import android.content.Context
import android.location.Location
import android.location.LocationListener
import android.location.LocationManager
import android.os.Bundle
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.prahastha.get_location/native"
    private val CHANNELLOC = "location_service"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNELLOC).setMethodCallHandler {
                call, result ->
            if (call.method == "getCoordinatesGPSOnly") {
                val locationManager = getSystemService(Context.LOCATION_SERVICE) as LocationManager
                val listener = object : LocationListener {
                    override fun onLocationChanged(location: Location) {
                        val coordinates = mapOf(
                            "latitude" to location.latitude,
                            "longitude" to location.longitude,
                            "accuracy" to location.accuracy,
                        )
                         result.success(coordinates)
//                        result.success(location)
                        locationManager.removeUpdates(this)
                    }

                    override fun onStatusChanged(provider: String?, status: Int, extras: Bundle?) {}
                    override fun onProviderEnabled(provider: String) {}
                    override fun onProviderDisabled(provider: String) {}
                }

                try {
                    locationManager.requestLocationUpdates(LocationManager.GPS_PROVIDER, 0L, 0f, listener)
                } catch (e: SecurityException) {
                    result.error("PERMISSION_DENIED", "Location permission denied", null)
                }
            } else if (call.method == "getCoordinatesAGPSOnly") {
                val locationManager = getSystemService(Context.LOCATION_SERVICE) as LocationManager
                val listener = object : LocationListener {
                    override fun onLocationChanged(location: Location) {
                        val coordinates = mapOf(
                            "latitude" to location.latitude,
                            "longitude" to location.longitude,
                            "accuracy" to location.accuracy,
                        )
                         result.success(coordinates)
//                        result.success(location)
                        locationManager.removeUpdates(this)
                    }

                    override fun onStatusChanged(provider: String?, status: Int, extras: Bundle?) {}
                    override fun onProviderEnabled(provider: String) {}
                    override fun onProviderDisabled(provider: String) {}
                }

                try {
                    locationManager.requestLocationUpdates(LocationManager.NETWORK_PROVIDER, 0L, 0f, listener)
                } catch (e: SecurityException) {
                    result.error("PERMISSION_DENIED", "Location permission denied", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }

//    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
//        super.configureFlutterEngine(flutterEngine)
//        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
//            call, result ->
//            when(call.method) {
//                "getNativeString" -> {
//                    val nativeString = getNativeString()
//                    println("Masuk Sini Mas Brow")
//                    result.success(nativeString)
//                }
//                else -> {
//                    println("Masuk Sono Mas Brow")
//                    result.notImplemented()
//                }
//            }
//        }
//    }

   private fun getNativeString(): String {
       return "Hello from  momogi Olala"
   }
}