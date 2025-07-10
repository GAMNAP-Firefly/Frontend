part of 'test_processing_bloc.dart';

@immutable
abstract class TestProcessingState {
  final Question currentQuestion;
  final bool isLoading;
  final String? errorMessage;

  const TestProcessingState({
    required this.currentQuestion,
    this.isLoading = false,
    this.errorMessage,
  });

  double get progress => currentQuestion.progressPercent / 100;
}

class TestProcessingInitial extends TestProcessingState {
  const TestProcessingInitial({
    required super.currentQuestion,
    super.isLoading,
    super.errorMessage,
  });
}

class TestProcessingLoading extends TestProcessingState {
  const TestProcessingLoading({
    required super.currentQuestion,
    super.errorMessage,
  }) : super(isLoading: true);
}

class TestProcessingLoaded extends TestProcessingState {
  const TestProcessingLoaded({
    required super.currentQuestion,
    super.errorMessage,
  }) : super(isLoading: false);
}

class TestProcessingError extends TestProcessingState {
  const TestProcessingError({
    required super.currentQuestion,
    required String errorMessage,
  }) : super(isLoading: false, errorMessage: errorMessage);
}

class TestProcessingCompleted extends TestProcessingState {
  const TestProcessingCompleted({
    required super.currentQuestion,
  }) : super(isLoading: false);
}