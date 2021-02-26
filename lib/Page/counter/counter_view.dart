import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'counter_logic.dart';

class CounterPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final CounterLogic logic = Get.put(CounterLogic());

    return Scaffold(
      appBar: AppBar(title: const Text('GetX计数器')),
      body: Center(
        child: Obx(
          () {
            logic.countBuildTime++;
            Widget widget = Text('点击了 ${logic.count.value} 次, 刷新了 ${logic.countBuildTime} 次',
                style: TextStyle(fontSize: 16.0));
            return widget;
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => logic.increase(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
