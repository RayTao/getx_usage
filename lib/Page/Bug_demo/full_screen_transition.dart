import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Flutter allows you to open routes "fullScreenDialog",
/// which looks more like a dialog with an "x" in the upper corner to close,
/// it is a navigation feature of Flutter itself, it is not something of Getx.
/// fix-insert transition: Transition.fade
class FullScreenTransition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Container(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(
            _TestPage(),
            fullscreenDialog: true,
            // transition: Transition.fade,
          );
        },
        label: Text('fullscreen push'),
        icon: Icon(Icons.arrow_forward),
      ),
    );
  }
}

class _TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Page'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.to(_TestPage1()),
        label: Text('Next'),
        icon: Icon(Icons.arrow_forward),
      ),
    );
  }
}

class _TestPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Page 1'),
      ),
    );
  }
}
