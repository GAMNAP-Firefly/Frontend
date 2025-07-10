class Test {
  final int id;
  final String name;
  final String description;

  const Test({
    required this.id,
    required this.name,
    required this.description,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Test &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name &&
              description == other.description;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ description.hashCode;
}