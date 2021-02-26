import 'package:get/get.dart';

class CounterLogic extends GetxController {
  var count = 0.obs;
  var countBuildTime = 0;

  ///自增 count变化多次 widget只刷新一次
  void increase() {
    ++count;
    count.value = count.value + 1;
    count.value = count.value - 1;

  }

}
