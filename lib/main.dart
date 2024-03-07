// import 'package:camera/camera.dart';
// import 'package:curved_bottom_navigation/navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import "package:provider/provider.dart";

import 'navigation_page.dart';
import 'provider/state_provider.dart';

// List<CameraDescription> cameras = [];
void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(seconds: 5));
  FlutterNativeSplash.remove();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => StateProvider()),
      // ChangeNotifierProvider(create: (context) => AuthState()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // final CameraDescription firstCamera;

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationPage(),
    );
  }
}
