import '../../../../core/data/data_source/api_service.dart';
import '../../domain/model/test.dart';
import '../../domain/repository/test_list_repository.dart';
import '../DTO/test_list_request.dart';
import '../DTO/test_list_response.dart';

class TestListRepositoryImpl implements TestListRepository {
  final ApiService apiService;

  TestListRepositoryImpl({required this.apiService});

  @override
  Future<List<Test>> getTests() async {
    final response = await apiService.post(
      '/api/v1/tests/list',
      TestListRequest().toJson(),
    );

    final testListResponse = TestListResponse.fromJson(response);

    return testListResponse.tests
        .map((test) => Test(
      id: test.id,
      name: test.name,
      description: test.description,
    ))
        .toList();
  }
}