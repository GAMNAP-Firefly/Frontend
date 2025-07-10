import 'test_response.dart';

class TestListResponse {
  final List<TestResponse> tests;

  TestListResponse({required this.tests});

  factory TestListResponse.fromJson(Map<String, dynamic> json) {
    return TestListResponse(
      tests: (json['tests'] as List)
          .map((test) => TestResponse.fromJson(test))
          .toList(),
    );
  }
}