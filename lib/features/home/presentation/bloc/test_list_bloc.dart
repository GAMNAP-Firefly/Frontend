import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/model/test.dart';
import '../../domain/usecase/get_test.dart';

part 'test_list_event.dart';
part 'test_list_state.dart';

class TestListBloc extends Bloc<TestListEvent, TestListState> {
  final GetTests getTests;

  TestListBloc({required this.getTests}) : super(TestListInitial()) {
    on<LoadTests>(_onLoadTests);
  }

  Future<void> _onLoadTests(
      LoadTests event,
      Emitter<TestListState> emit,
      ) async {
    emit(TestListLoading());
    try {
      final tests = await getTests();
      emit(TestListLoaded(tests: tests));
    } catch (e) {
      emit(TestListError(message: e.toString()));
    }
  }
}