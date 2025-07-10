import '../model/test.dart';
import '../repository/test_list_repository.dart';

class GetTests {
  final TestListRepository repository;

  GetTests(this.repository);

  Future<List<Test>> call() async {
    return await repository.getTests();
  }
}