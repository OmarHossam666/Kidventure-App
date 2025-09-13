import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:kidventure/kidventure_app.dart';
import 'package:kidventure/secrets.dart';
import 'package:kidventure/core/apis/service_locator.dart';

Future<void> main() async {
  // Ensure Flutter binding is initialized
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Keep the splash screen visible until app is fully loaded
  // This is crucial for native splash screen in release mode
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize services with the service locator
  await ServiceLocator.initialize(
    geminiApiKey: googleGeminiAPI,
    enableGeminiDebugging: true,
  );

  runApp(const KidventureApp());
}
