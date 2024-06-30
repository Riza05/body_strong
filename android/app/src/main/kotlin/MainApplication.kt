package com.example.body_strong
import android.app.Application

import com.yandex.mapkit.MapKitFactory

class MainApplication: Application() {
    override fun onCreate() {
        super.onCreate()
        MapKitFactory.setApiKey("c3e808e0-e53b-4acb-94c8-11b56324ebfb") // Your generated API key
    }
}