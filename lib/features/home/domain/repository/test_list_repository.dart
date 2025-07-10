import '../model/test.dart';

abstract class TestListRepository {
  Future<List<Test>> getTests();
}