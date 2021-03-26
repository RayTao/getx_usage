// ignore: one_member_abstracts
import 'case_model.dart';
import 'home_provider.dart';

abstract class IHomeRepository {
  Future<CasesModel> getCases();
}


class HomeRepository implements IHomeRepository {
  HomeRepository({this.provider});
  final IHomeProvider provider;

  @override
  Future<CasesModel> getCases() async {
    final cases = await provider.getCases("/summary");
    if (cases.status.hasError) {
      return Future.error(cases.statusText);
    } else {
      return cases.body;
    }
  }
}