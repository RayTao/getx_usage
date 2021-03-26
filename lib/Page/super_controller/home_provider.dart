// ignore: one_member_abstracts
import 'package:get/get_connect/connect.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import 'case_model.dart';

abstract class IHomeProvider {
  Future<Response<CasesModel>> getCases(String path);
}

class HomeProvider extends GetConnect implements IHomeProvider {
  @override
  void onInit() {

  }

  @override
  Future<Response<CasesModel>> getCases(String path) {
    httpClient.defaultDecoder = CasesModel.fromJson;
    httpClient.baseUrl = 'https://api.covid19api.com';
    return get(path);
  }
}