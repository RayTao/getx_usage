import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:getx_usage/rout_config.dart';

class HomeWidget extends StatelessWidget {
  List<GetPage> get pages => RouteConfig.getPages;

  @override
  Widget build(BuildContext context) {
    Widget divider1 = Divider(color: Colors.blue);
    return Scaffold(
      appBar: AppBar(title: const Text('GetX Counter')),
      body: ListView.separated(
        itemCount: pages.length,
        separatorBuilder: (context, index) => divider1,
        itemBuilder: (context, index) {
          final name = pages[index].name;
          final String title = name.replaceAll(RegExp(r'/'), '');
          return InkWell(
            child: ListTile(title: Text(title)),
            onTap: () => Get.toNamed(name),
          );
        },
      ),
    );
  }
}
