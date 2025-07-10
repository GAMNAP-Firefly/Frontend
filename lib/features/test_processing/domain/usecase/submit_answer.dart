import 'package:fittest/features/test_processing/domain/repository/test_repository.dart';

class SubmitAnswer {
  final TestRepository repository;

  SubmitAnswer(this.repository);

  Future<void> call(int questionId, int variantId, int resultId) async {
    return await repository.submitAnswer(questionId, variantId, resultId);
  }
}