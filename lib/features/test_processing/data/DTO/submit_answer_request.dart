class SubmitAnswerRequest {
  final int questionId;
  final int variantId;
  final int resultId;

  SubmitAnswerRequest({
    required this.questionId,
    required this.variantId,
    required this.resultId,
  });

  Map<String, dynamic> toJson() => {
    'question_id': questionId,
    'variant_id': variantId,
    'result_id': resultId,
  };
}