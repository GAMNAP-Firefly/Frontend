import 'package:fittest/features/test_processing/domain/model/question.dart';
import 'package:fittest/features/test_processing/domain/repository/test_repository.dart';

class StartTest {
  final TestRepository repository;

  StartTest(this.repository);

  Future<Question> call(int testId) async {
    return await repository.startTest(testId);
  }
}