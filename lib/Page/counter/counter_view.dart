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
            Obx(//使用StreamBuilder会消耗一定内存
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
            Obx(() => Text('Name: ${logic.user.value.name} age: ${logic.user.value.age}')),
            FlatButton(
              onPressed: () {
                logic.updateUser();
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => _DemoWidget(),));
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

class _DemoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    /// Obx()对应Controller内存由Route管理 不在GetPageRoute路由范围的无法释放
    // final CounterLogic logic = Get.put(CounterLogic(), tag: '_demo');
    // return Scaffold(
    //   appBar: AppBar(title: const Text('GetX Counter')),
    //   body: Center(
    //     child: Column(
    //       children: [
    //         Obx(//使用StreamBuilder会消耗一定内存
    //               () {
    //             logic.countBuildTime++;
    //             Widget widget = Text(
    //                 'Click time:${logic.count.value}, build time:${logic.countBuildTime}',
    //                 style: TextStyle(fontSize: 16.0));
    //             return widget;
    //           },
    //         ),
    //       ],
    //     ),
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: () {
    //       logic.increase();
    //     },
    //     child: const Icon(Icons.add),
    //   ),
    // );


    return Scaffold(
      appBar: AppBar(title: const Text('GetX _demo')),
      body: Center(
        child: Column(
          children: [
            GetBuilder<CounterLogic>(
              init: CounterLogic(),//实际上是StateFulWidget封装消耗内存很少
              tag: '_demo',
              builder: (logic) {
                logic.countBuildTime += 1;
                return Text(
                    'Click time:${logic.count}, build time:${logic.countBuildTime}');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final logic = Get.find<CounterLogic>(tag: '_demo');
          logic.increaseAndUpdate();
        },
        child: const Icon(Icons.add),
      ),
    );
  }


}