import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_usage/Page/counter/counter_logic.dart';

class MemoBugPage extends StatelessWidget {
  /// Obx()对应Controller内存由Route管理 不在GetPageRoute路由范围的无法释放
  /// GetBuilder包裹可以正常释放内存
  final CounterLogic logic = Get.put(CounterLogic(), tag: '_demo');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GetX Counter')),
      body: Center(
        child: Column(
          children: [
            Obx(
              //使用StreamBuilder会消耗一定内存
              () {
                logic.countBuildTime++;
                Widget widget = Text(
                    'Click time:${logic.count.value}, build time:${logic.countBuildTime}',
                    style: TextStyle(fontSize: 16.0));
                return widget;
              },
            ),
            // GetBuilder<CounterLogic>(
            //   init: CounterLogic(),
            //   tag: '_demo',
            //   builder: (logic) {
            //     logic.countBuildTime += 1;
            //     return Text(
            //         'Click time:${logic.count}, build time:${logic.countBuildTime}');
            //   },
            // ),
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
