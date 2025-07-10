import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:fittest/features/test_processing/data/repository/test_repository_impl.dart';
import 'package:fittest/features/test_processing/domain/repository/test_repository.dart';
import 'package:fittest/features/test_processing/domain/usecase/get_question.dart';
import 'package:fittest/features/test_processing/domain/usecase/start_test.dart';
import 'package:fittest/features/test_processing/domain/usecase/submit_answer.dart';
import 'package:fittest/features/test_processing/domain/usecase/complete_test.dart';
import 'package:fittest/core/data/data_source/api_service.dart';

import '../features/home/data/repository/test_list_repository_impl.dart';
import '../features/home/domain/repository/test_list_repository.dart';
import '../features/home/domain/usecase/get_test.dart';
import '../features/home/presentation/bloc/test_list_bloc.dart';
import '../features/test_processing/presentation/bloc/test_processing_bloc.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  _setupCoreDependencies();

  _setupTestProcessingDependencies();

  _setupTestListDependencies();
}

void _setupCoreDependencies() {
  getIt.registerLazySingleton(() => http.Client());

  getIt.registerLazySingleton(() => ApiService(
    baseUrl: 'http://77.110.125.71:8080',
    client: getIt(),
  ));
}

void _setupTestProcessingDependencies() {
  getIt.registerLazySingleton<TestRepository>(
        () => TestRepositoryImpl(apiService: getIt()),
  );

  getIt.registerLazySingleton(() => StartTest(getIt()));
  getIt.registerLazySingleton(() => GetQuestion(getIt()));
  getIt.registerLazySingleton(() => SubmitAnswer(getIt()));
  getIt.registerLazySingleton(() => TestComplete(getIt()));

  getIt.registerFactory(
        () => TestProcessingBloc(
      startTest: getIt(),
      getQuestion: getIt(),
      submitAnswer: getIt(),
      completeTest: getIt(),
    ),
  );
}

void _setupTestListDependencies() {
  getIt.registerLazySingleton<TestListRepository>(
        () => TestListRepositoryImpl(apiService: getIt()),
  );

  getIt.registerLazySingleton(() => GetTests(getIt()));

  getIt.registerLazySingleton(
        () => TestListBloc(getTests: getIt()),
  );
}