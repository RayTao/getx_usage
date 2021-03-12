import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'counter_logic.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterLogic logic = Get.put(CounterLogic());

    return Scaffold(
      appBar: AppBar(title: const Text('GetX Counter')),
      body: Center(
        child: Column(
          children: [
            Obx(
              () {
                logic.countBuildTime++;
                Widget widget = Text(
                    'Click time:${logic.count.value}, build time:${logic.countBuildTime}',
                    style: TextStyle(fontSize: 16.0));
                return widget;
              },
            ),
            FlatButton(
              onPressed: () {
                logic.sameValue();
              },
              child: const Icon(Icons.donut_small),
            ),
            Obx(
              () {
                Widget widget = Text(
                    'People num:${logic.people.value}',
                    style: TextStyle(fontSize: 16.0));
                return widget;
              },
            ),
            FlatButton(
              onPressed: () {
                logic.addPeople();
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          logic.increase();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
