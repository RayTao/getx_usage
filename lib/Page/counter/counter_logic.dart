import 'package:get/get.dart';

class CounterLogic extends GetxController {
  var count = 0.obs;
  var countBuildTime = 0;

  ///自增
  ///count变化多次 widget只刷新一次 是因为setState不会马上刷新
  ///setState()过程主要工作是记录所有的脏元素，添加到BuildOwner对象
  ///的_dirtyElements成员变量，然后调用scheduleFrame来注册Vsync回调。
  /// 当下一次vsync信号的到来时会执行 所以多次setState() 只会build一次
  void increase() {
    ++count;
    count.value = count.value + 1;
    count.value = count.value - 1;
  }
}
