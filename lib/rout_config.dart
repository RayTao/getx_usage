import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'Page/counter/counter_view.dart';
import 'Page/home_widget.dart';

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
  static final String counterGet = "/counterGet";
  static final String jumpOne = "/jumpOne";
  static final String jumpTwo = "/jumpOne/jumpTwo";

  ///别名映射页面
  static final List<GetPage> getPages = [
    GetPage(name: main, page: () => HomeWidget()),
    // GetPage(name: dialog, page: () => Dialog()),
    // GetPage(name: counter, page: () => CounterPage()),
    // GetPage(name: testLayout, page: () => TestLayoutPage()),
    // GetPage(name: smartDialog, page: () => SmartDialogPage()),
    // GetPage(name: spanOne, page: () => SpanOnePage()),
    // GetPage(name: spanTwo, page: () => SpanTwoPage()),
    GetPage(name: counterGet, page: () => CounterPage()),
    // GetPage(name: jumpOne, page: () => JumpOnePage()),
    // GetPage(name: jumpTwo, page: () => JumpTwoPage()),
  ];
}
