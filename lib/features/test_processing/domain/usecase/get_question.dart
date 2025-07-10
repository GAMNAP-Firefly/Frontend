import 'package:fittest/features/test_processing/domain/model/question.dart';
import 'package:fittest/features/test_processing/domain/repository/test_repository.dart';

class GetQuestion {
  final TestRepository repository;

  GetQuestion(this.repository);

  Future<Question> call(int questionId, int resultId) async {
    return await repository.getQuestion(questionId, resultId);
  }
}