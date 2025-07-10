import 'variant.dart';

class Question {
  final int id;
  final String text;
  final int index;
  final int total;
  final double progressPercent;
  final List<Variant> variants;
  final int resultId;

  const Question({
    required this.id,
    required this.text,
    required this.index,
    required this.total,
    required this.progressPercent,
    required this.variants,
    required this.resultId,
  });

  Question copyWith({
    int? id,
    String? text,
    int? index,
    int? total,
    double? progressPercent,
    List<Variant>? variants,
    int? resultId,
  }) {
    return Question(
      id: id ?? this.id,
      text: text ?? this.text,
      index: index ?? this.index,
      total: total ?? this.total,
      progressPercent: progressPercent ?? this.progressPercent,
      variants: variants ?? this.variants,
      resultId: resultId ?? this.resultId,
    );
  }
}