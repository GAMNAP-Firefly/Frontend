import 'package:fittest/features/test_processing/domain/model/question.dart';

abstract class TestRepository {
  Future<Question> startTest(int testId);
  Future<Question> getQuestion(int questionId, int resultId);
  Future<void> submitAnswer(int questionId, int variantId, int resultId);
  Future<Question> getQuestionByIndex(int questionIndex, int resultId);
  Future<void> completeTest(int resultId);
}