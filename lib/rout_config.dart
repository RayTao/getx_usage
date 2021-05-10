import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:getx_usage/Page/counter_easy_get/counter_easy_get_view.dart';
import 'package:getx_usage/Page/super_controller/super_controller_view.dart';

import 'Page/Bug_demo/getx_bug_page.dart';
import 'Page/counter/counter_view.dart';
import 'Page/home_widget.dart';
import 'Page/online_shop/views/shopping_page.dart';

class RouteConfig {
  ///主页面
  static final String main = "/home";

  ///dialog页面
  static final String dialog = "/dialog";

  // ///bloc计数器模块
  // static final String counter = "/counter";
  //
  // ///测试布局页面
  // static final String testLayout = "/testLayout";
  //
  // ///演示SmartDialog控件
  // static final String smartDialog = "/smartDialog";
  //
  // ///Bloc跨页面传递事件
  // static final String spanOne = "/spanOne";
  // static final String spanTwo = "/spanOne/spanTwo";

  ///GetX 计数器  跨页面交互
  static final String counterObx = "/counter_Obx";
  static final String counterBuilder = "/counter_Builder";
  static final String superController = "/superController";
  static final String jumpOne = "/jumpOne";
  static final String jumpTwo = "/jumpOne/jumpTwo";
  static final String onlineShopping = "/online_shopping";
  static final String getxBug = "/getx_bug_page";

  ///别名映射页面
  static final List<GetPage> getPages = [
    GetPage(name: main, page: () => HomeWidget()),
    // GetPage(name: dialog, page: () => Dialog()),
    // GetPage(name: counter, page: () => CounterPage()),
    // GetPage(name: testLayout, page: () => TestLayoutPage()),
    // GetPage(name: smartDialog, page: () => SmartDialogPage()),
    // GetPage(name: spanOne, page: () => SpanOnePage()),
    // GetPage(name: spanTwo, page: () => SpanTwoPage()),
    GetPage(name: counterObx, page: () => CounterPage()),
    GetPage(name: counterBuilder, page: () => CounterEasyGetPage()),
    GetPage(name: superController, page: () => SuperControllerPage()),
    GetPage(name: onlineShopping, page: () => ShoppingPage()),
    GetPage(name: getxBug, page: () => GetxBugPage()),
    // GetPage(name: jumpOne, page: () => JumpOnePage()),
    // GetPage(name: jumpTwo, page: () => JumpTwoPage()),
  ];
}
