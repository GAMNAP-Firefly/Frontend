import 'package:fittest/features/test_processing/domain/model/question.dart';
import 'package:fittest/features/test_processing/domain/model/variant.dart';

class StartTestResponse {
  final int resultId;
  final Question question;

  StartTestResponse({required this.resultId, required this.question});

  factory StartTestResponse.fromJson(Map<String, dynamic> json) {
    return StartTestResponse(
      resultId: json['result_id'],
      question: Question(
        id: json['question']['id'],
        text: json['question']['text'],
        index: json['question']['index'],
        total: json['question']['total'],
        progressPercent: json['question']['progress_percent'],
        variants: (json['question']['variants'] as List)
            .map((v) => Variant(id: v['id'], text: v['text']))
            .toList(),
        resultId: json['result_id'],
      ),
    );
  }
}