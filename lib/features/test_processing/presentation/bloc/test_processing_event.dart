part of 'test_processing_bloc.dart';

@immutable
abstract class TestProcessingEvent {}

class LoadInitialQuestion extends TestProcessingEvent {
  final int testId;

  LoadInitialQuestion(this.testId);
}

class LoadQuestion extends TestProcessingEvent {
  final int questionId;
  final int resultId;

  LoadQuestion(this.questionId, this.resultId);
}

class AnswerQuestion extends TestProcessingEvent {
  final int questionId;
  final int variantId;
  final int resultId;

  AnswerQuestion(this.questionId, this.variantId, this.resultId);
}

class NavigateToQuestion extends TestProcessingEvent {
  final int questionIndex;
  final int resultId;

  NavigateToQuestion(this.questionIndex, this.resultId);
}

class CompleteTest extends TestProcessingEvent {
  final int resultId;

  CompleteTest(this.resultId);
}