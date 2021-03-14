import 'package:get/get.dart';
import 'package:getx_usage/Page/counter/User.dart';

class CounterLogic extends GetxController {
  var count = 0.obs;
  var people = 0.obs;
  var countBuildTime = 0;
  final user = User().obs;

  @override
  void onInit() {
    super.onInit();
    /// 第一次赋值不再强制刷新
    count.firstRebuild = false;
  }

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

  /// 有当响应式变量的值发生变化时，才会会执行刷新操作
  sameValue() {
    count.value = count.value;
  }

  addPeople() {
    ++people;
  }

  /// 更新自定义对象的响应类型 user.update或者user(User(name: '', age: 35))
  updateUser() {
    user.update((val) {
      val.name += 'hei';
      val.age += 1;
    });
  }
}
