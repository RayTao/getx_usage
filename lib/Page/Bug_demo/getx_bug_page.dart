import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'dialog_jump_bug_page.dart';
import 'full_screen_transition.dart';
import 'memo_bug_page.dart';

class GetxBugPage extends StatelessWidget {
  final pages = [
    GetPage(
      name: 'memo_bug',
      page: () => MemoBugPage(),
    ),
    GetPage(
      name: 'dialog_jump_bug',
      page: () => DialogJumpBugPage(),
    ),
    GetPage(
      name: 'full_screen_transition_bug',
      page: () => FullScreenTransition(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Widget divider1 = Divider(color: Colors.blue);
    return Scaffold(
      // backgroundColor: Colors.teal,
      appBar: AppBar(title: const Text('GetX Bug Page')),
      body: ListView.separated(
        itemCount: pages.length,
        separatorBuilder: (context, index) => divider1,
        itemBuilder: (context, index) {
          final name = pages[index].name;
          final String title = name.replaceAll(RegExp(r'/'), '');
          return InkWell(
            child: ListTile(title: Text(title)),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => pages[index].page(),
              ));
              // Navigator.of(context).push(GetPageRoute(page: pages[index].page));
            },
          );
        },
      ),
    );
  }
}
