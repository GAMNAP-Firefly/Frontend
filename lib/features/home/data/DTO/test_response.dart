class TestResponse {
  final int id;
  final String name;
  final String description;

  TestResponse({
    required this.id,
    required this.name,
    required this.description,
  });

  factory TestResponse.fromJson(Map<String, dynamic> json) {
    return TestResponse(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}