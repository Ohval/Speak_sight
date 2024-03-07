import 'package:flutter/material.dart';
import 'package:speak_sight/theme/extention.dart';

class StateProvider extends ChangeNotifier {
  var shownWidget = Center(
      child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(23)),
              border: Border.all(
                color: Colors.blueAccent,
              )),
          child: const SizedBox(
                  height: 40, width: 40, child: CircularProgressIndicator())
              .p(130)));
  var firstWidget = Center(
      child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(23)),
              border: Border.all(
                color: Colors.blueAccent,
              )),
          child: const SizedBox(
                  height: 40, width: 40, child: CircularProgressIndicator())
              .p(130)));
  var secondWidget = const Center(
    child: Text(
      " 9 ",
      style: TextStyle(fontSize: 53),
    ),
  );

  bool showFirstChild = true;

  void toggleChild() {
    showFirstChild = !showFirstChild;

    if (showFirstChild == false) {
      shownWidget = secondWidget;
    } else {
      shownWidget = firstWidget;
    }

    debugPrint("$showFirstChild");
    notifyListeners();
  }
}
