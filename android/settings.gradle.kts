pluginManagement {
    val flutterSdkPath = run {
        val properties = java.util.Properties()
        file("local.properties").inputStream().use { properties.load(it) }
        val flutterSdkPath = properties.getProperty("flutter.sdk")
        require(flutterSdkPath != null) { "flutter.sdk not set in local.properties" }
        flutterSdkPath
    }

    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    repositories {
        gradlePluginPortal()
        google()
        mavenCentral()
    }

    plugins {
        id("com.android.application") version "8.1.0" apply false
        id("com.android.library") version "8.1.0" apply false
        id("org.jetbrains.kotlin.android") version "1.9.10" apply false
    }
}

plugins {
    id("dev.flutter.flutter-plugin-loader") version "1.0.0"
    id("com.android.application") version "8.1.0" apply false
    id("org.jetbrains.kotlin.android") version "1.9.10" apply false
}

include(":app")
