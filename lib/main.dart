// import 'package:camera/camera.dart';
// import 'package:curved_bottom_navigation/navigation_page.dart';
import 'package:flutter/material.dart';

import 'navigation_page.dart';

// List<CameraDescription> cameras = [];
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
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
