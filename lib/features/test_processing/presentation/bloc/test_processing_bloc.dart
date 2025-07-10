import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:fittest/features/test_processing/domain/model/question.dart';
import 'package:fittest/features/test_processing/domain/usecase/get_question.dart';
import 'package:fittest/features/test_processing/domain/usecase/start_test.dart';
import 'package:fittest/features/test_processing/domain/usecase/submit_answer.dart';
import 'package:fittest/features/test_processing/domain/usecase/complete_test.dart';

part 'test_processing_event.dart';
part 'test_processing_state.dart';

class TestProcessingBloc extends Bloc<TestProcessingEvent, TestProcessingState> {
  final StartTest startTest;
  final GetQuestion getQuestion;
  final SubmitAnswer submitAnswer;
  final TestComplete completeTest;

  TestProcessingBloc({
    required this.startTest,
    required this.getQuestion,
    required this.submitAnswer,
    required this.completeTest,
  }) : super(const TestProcessingInitial(
    currentQuestion: Question(
      id: 0,
      text: '',
      index: 0,
      total: 0,
      progressPercent: 0,
      variants: [],
      resultId: 0,
    ),
    isLoading: true,
  )) {
    on<LoadInitialQuestion>(_onLoadInitialQuestion);
    on<LoadQuestion>(_onLoadQuestion);
    on<AnswerQuestion>(_onAnswerQuestion);
    on<NavigateToQuestion>(_onNavigateToQuestion);
    on<CompleteTest>(_onCompleteTest);
  }

  Future<void> _onLoadInitialQuestion(
      LoadInitialQuestion event,
      Emitter<TestProcessingState> emit,
      ) async {
    emit(TestProcessingLoading(currentQuestion: state.currentQuestion));

    try {
      final question = await startTest(event.testId);
      emit(TestProcessingLoaded(currentQuestion: question));
    } catch (e) {
      emit(TestProcessingError(
        currentQuestion: state.currentQuestion,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onLoadQuestion(
      LoadQuestion event,
      Emitter<TestProcessingState> emit,
      ) async {
    emit(TestProcessingLoading(currentQuestion: state.currentQuestion));

    try {
      final question = await getQuestion(event.questionId, event.resultId);
      emit(TestProcessingLoaded(currentQuestion: question));
    } catch (e) {
      emit(TestProcessingError(
        currentQuestion: state.currentQuestion,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onAnswerQuestion(
      AnswerQuestion event,
      Emitter<TestProcessingState> emit,
      ) async {
    emit(TestProcessingLoading(currentQuestion: state.currentQuestion));

    try {
      await submitAnswer(event.questionId, event.variantId, event.resultId);

      final updatedVariants = state.currentQuestion.variants.map((variant) {
        return variant.copyWith(
          isSelected: variant.id == event.variantId,
        );
      }).toList();

      final updatedQuestion = state.currentQuestion.copyWith(
        variants: updatedVariants,
      );

      emit(TestProcessingLoaded(currentQuestion: updatedQuestion));
    } catch (e) {
      emit(TestProcessingError(
        currentQuestion: state.currentQuestion,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onNavigateToQuestion(
      NavigateToQuestion event,
      Emitter<TestProcessingState> emit,
      ) async {
    emit(TestProcessingLoading(currentQuestion: state.currentQuestion));

    try {
      final question = await getQuestion(event.questionIndex, event.resultId);
      emit(TestProcessingLoaded(currentQuestion: question));
    } catch (e) {
      emit(TestProcessingError(
        currentQuestion: state.currentQuestion,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onCompleteTest(
      CompleteTest event,
      Emitter<TestProcessingState> emit,
      ) async {
    emit(TestProcessingLoading(currentQuestion: state.currentQuestion));

    try {
      await completeTest(event.resultId);
      emit(TestProcessingCompleted(
        currentQuestion: state.currentQuestion,
      ));
    } catch (e) {
      emit(TestProcessingError(
        currentQuestion: state.currentQuestion,
        errorMessage: e.toString(),
      ));
    }
  }
}