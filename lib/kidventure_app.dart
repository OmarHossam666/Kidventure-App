import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidventure/core/apis/service_locator.dart';
import 'package:kidventure/core/routing/router.dart';

class KidventureApp extends StatefulWidget {
  const KidventureApp({super.key});

  @override
  State<KidventureApp> createState() => _KidventureAppState();
}

class _KidventureAppState extends State<KidventureApp> {
  @override
  void initState() {
    super.initState();

    // Remove splash screen with a slight delay to ensure it's visible
    // This helps ensure the splash screen is shown in release mode
    Timer(const Duration(milliseconds: 800), () {
      FlutterNativeSplash.remove();
    });
  }

  @override
  void dispose() {
    try {
      // Clean up service instances
      ServiceLocator.instance.dispose();
    } catch (error) {
      debugPrint('Error disposing services: $error');
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Kidventure',
          theme: ThemeData(fontFamily: 'CrimsonText'),
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
