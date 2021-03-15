import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'counter_easy_get_logic.dart';
import 'counter_easy_get_state.dart';

class CounterEasyGetPage extends StatelessWidget {
  final CounterEasyGetLogic logic = Get.put(CounterEasyGetLogic());
  final CounterEasyGetState state = Get.find<CounterEasyGetLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GetX Counter Easy Builder')),
      body: Center(
        child: Column(
          children: [
            GetBuilder<CounterEasyGetLogic>(//实际上是StateFulWidget封装消耗内存很少
              builder: (controller) {
                logic.countBuildTime += 1;
                return Text(
                    'Click time:${logic.count}, build time:${logic.countBuildTime}');
              },
            ),
            // GetX(),
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
