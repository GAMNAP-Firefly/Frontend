part of 'test_list_bloc.dart';

abstract class TestListState extends Equatable {
  const TestListState();

  @override
  List<Object> get props => [];
}

class TestListInitial extends TestListState {}

class TestListLoading extends TestListState {}

class TestListLoaded extends TestListState {
  final List<Test> tests;

  const TestListLoaded({required this.tests});

  @override
  List<Object> get props => [tests];
}

class TestListError extends TestListState {
  final String message;

  const TestListError({required this.message});

  @override
  List<Object> get props => [message];
}