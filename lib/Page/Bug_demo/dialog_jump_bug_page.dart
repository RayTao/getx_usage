import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// PageA--Get.dialog_to_PageB-PageC--close pageC--PageB_open_pageC does'nt work
class DialogJumpBugPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page A'),
      ),
      body: Center(
        child: TextButton(
          child: Text('Open PageB'),
          onPressed: () {
            //open a dialog page
            Get.dialog(_PageB());
          },
        ),
      ),
    );
  }
}

class _PageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        child: Container(
          width: 500,
          height: 300,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: Colors.grey
              )
          ),
          child: Column(
            children: [
              Text('Page B',style: TextStyle(fontSize: 28),),
              Expanded(
                flex: 1,
                child: Center(
                  child: TextButton(
                    child: Text('Open PageC'),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.tealAccent)),
                    onPressed: () {
                      // open a navigator page
                      // navigator.push(
                      //   MaterialPageRoute(
                      //     builder: (_) {
                      //       return _PageC();
                      //     },
                      //   ),
                      // );
                      Get.to(_PageC());
                      ///Let's leave this issue open, as we can improve this approach.
                      ///What is happening is that on the back of the second page the navigation stack has a dialog before the home page,
                      ///so the current route has not been changed yet and the GetX navigation blocks navigation for the same route.
                      // Get.to(_PageC(), preventDuplicates: false);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _PageC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page C'),
      ),
      body: Center(
        child: Text('Page C'),
      ),
    );
  }
}