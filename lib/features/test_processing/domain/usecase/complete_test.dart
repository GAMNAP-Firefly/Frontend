import 'package:fittest/features/test_processing/domain/repository/test_repository.dart';

class TestComplete {
  final TestRepository repository;

  TestComplete(this.repository);

  Future<void> call(int resultId) async {
    return await repository.completeTest(resultId);
  }
}