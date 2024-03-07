import 'package:audioplayers/audioplayers.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:speak_sight/provider/state_provider.dart';
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
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Profile",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Gap(51),
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(1000)),
                border: Border.all(
                  color: Colors.transparent,
                )),
            child: Image.asset(
              "assets/4.png",
              fit: BoxFit.contain,
            ).circularCorner(23),
          ),
          const Gap(23),
          const Text(
            "Speak Sight user",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const Gap(3),
          const Text(
            "speaksightuser@example.com",
            style: TextStyle(color: Colors.blueGrey),
          ),
          const Gap(23),
          Container(
            color: Colors.blueAccent,
            width: 170,
            height: 50,
            child: const Center(
              child: Text(
                "Edit Profile",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ).circularCorner(23).ripple(() {}, borderRadius: 23),
          const Gap(70),
          //Settings
          Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(57, 130, 178, 255),
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(12), right: Radius.circular(31))),
            child: const Row(
              children: [
                Gap(23),
                Icon(Icons.settings),
                Gap(8),
                Text("Settings"),
                Spacer(),
                Icon(Icons.arrow_forward_ios_rounded),
                Gap(18)
              ],
            ).vP16,
          ).vP8,
          //Billing
          Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(57, 130, 178, 255),
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(12), right: Radius.circular(31))),
            child: const Row(
              children: [
                Gap(23),
                Icon(Icons.person_add_alt),
                Gap(8),
                Text("User Management"),
                Spacer(),
                Icon(Icons.arrow_forward_ios_rounded),
                Gap(18)
              ],
            ).vP16,
          ).vP8,
          //usermanagement

          //information
        ],
      ).alignCenter,
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
    // var showFirstChild = context.watch<StateProvider>().showFirstChild,
    //     firstWidget = context.watch<StateProvider>().firstWidget,
    //     secondWidget = context.watch<StateProvider>().secondWidget;

    // late bool showFirstChild = !!!true;
    // var shownWidget = showFirstChild ? firstWidget : secondWidget;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: SizedBox(
              height: 300,
              width: double.infinity,
              child: context.watch<StateProvider>().shownWidget,
            ),
          ),
          const Gap(51),
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
            // setState(() {
            //   showFirstChild = !showFirstChild;
            // });
            context.read<StateProvider>().toggleChild();

            if (context.read<StateProvider>().showFirstChild == false) {
              await Future.delayed(const Duration(seconds: 1));

              await player.load("nine.mp3");
              await AudioPlayer().play(AssetSource("nine.mp3"));
            }
          }, borderRadius: 23).alignCenter,
        ],
      ),
    );
  }
}
