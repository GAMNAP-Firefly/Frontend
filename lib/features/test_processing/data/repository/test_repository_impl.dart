import 'package:fittest/core/data/data_source/api_service.dart';
import 'package:fittest/features/test_processing/data/DTO/start_test_request.dart';
import 'package:fittest/features/test_processing/data/DTO/start_test_response.dart';
import 'package:fittest/features/test_processing/data/DTO/submit_answer_request.dart';
import 'package:fittest/features/test_processing/domain/model/question.dart';
import 'package:fittest/features/test_processing/domain/model/variant.dart';
import 'package:fittest/features/test_processing/domain/repository/test_repository.dart';

class TestRepositoryImpl implements TestRepository {
  final ApiService apiService;

  TestRepositoryImpl({required this.apiService});

  @override
  Future<Question> startTest(int testId) async {
    final response = await apiService.post(
      '/api/v1/tests/start',
      StartTestRequest(testId: testId).toJson(),
    );
    return StartTestResponse.fromJson(response).question;
  }

  @override
  Future<Question> getQuestion(int questionId, int resultId) async {
    final response = await apiService.post(
      '/api/v1/answered/question',
      {'question_id': questionId, 'result_id': resultId},
    );
    return _parseQuestion(response, resultId);
  }

  @override
  Future<void> submitAnswer(int questionId, int variantId, int resultId) async {
    await apiService.post(
      '/api/v1/answers/submit',
      SubmitAnswerRequest(
        questionId: questionId,
        variantId: variantId,
        resultId: resultId,
      ).toJson(),
    );
  }

  @override
  Future<Question> getQuestionByIndex(int questionIndex, int resultId) async {
    final response = await apiService.post(
      '/api/v1/questions/next',
      {'question_index': questionIndex, 'result_id': resultId},
    );
    return _parseQuestion(response, resultId);
  }

  @override
  Future<void> completeTest(int resultId) async {
    await apiService.post(
      '/api/v1/results/finish',
      {'result_id': resultId},
    );
  }

  Question _parseQuestion(Map<String, dynamic> json, int resultId) {
    return Question(
      id: json['id'],
      text: json['text'],
      index: json['index'],
      total: json['total'],
      progressPercent: json['progress_percent'],
      variants: (json['variants'] as List)
          .map((v) => Variant(id: v['id'], text: v['text']))
          .toList(),
      resultId: resultId,
    );
  }
}