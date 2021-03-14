import 'package:get/get.dart';

import 'counter_easy_get_state.dart';

class CounterEasyGetLogic extends GetxController {
  final state = CounterEasyGetState();
  var count = 0;
  var countBuildTime = 0;

  increase() {
    ++count;
    update();
  }
}
