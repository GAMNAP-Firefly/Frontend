class StartTestRequest {
  final int testId;

  StartTestRequest({required this.testId});

  Map<String, dynamic> toJson() => {'test_id': testId};
}