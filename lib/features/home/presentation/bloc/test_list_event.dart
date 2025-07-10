part of 'test_list_bloc.dart';

abstract class TestListEvent extends Equatable {
  const TestListEvent();

  @override
  List<Object> get props => [];
}

class LoadTests extends TestListEvent {}