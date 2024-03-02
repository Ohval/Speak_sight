import 'package:audioplayers/audioplayers.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:speak_sight/theme/extention.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});
  // final CameraDescription firstCamera;

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  List<Widget> pages = <Widget>[
    const DevicePage(),
    const HomePage(),
    const ProfilePage(),
  ];
  int _currentIndex = 1;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    // final CurvedNavigationBarState? navBarState =
    //     _bottomNavigationKey.currentState;
    // navBarState?.setPage(1);

    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 1,
          height: 60.0,
          items: const <Widget>[
            Icon(
              Icons.home_max_rounded,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.home_filled,
              size: 40,
              color: Colors.white,
            ),
            Icon(
              Icons.person_2,
              size: 30,
              color: Colors.white,
            ),
          ],
          color: Colors.blueAccent,
          buttonBackgroundColor: Colors.blueAccent,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              debugPrint(index.toString());
            });
          },
          letIndexChange: (index) => true,
        ),
        body: pages[_currentIndex]);
  }
}

class DevicePage extends StatelessWidget {
  const DevicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("coming soon"),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("coming soon"),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final player = AudioCache();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.asset(
                "assets/ily.gif",
                fit: BoxFit.fill,
              ).circularCorner(23),
            ),
          ),
          const Gap(31),
          Container(
            color: Colors.blueAccent,
            width: 150,
            height: 50,
            child: const Center(
              child: Text(
                "Start Analyzing",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ).circularCorner(23).ripple(() async {
            await Future.delayed(const Duration(seconds: 2));

            await player.load("nine.mp3");
            await AudioPlayer().play(AssetSource("nine.mp3"));
          }, borderRadius: 23).alignCenter,
        ],
      ),
    );
  }
}
