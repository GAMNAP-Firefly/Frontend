class Variant {
  final int id;
  final String text;
  final bool isSelected;

  const Variant({
    required this.id,
    required this.text,
    this.isSelected = false,
  });

  Variant copyWith({
    int? id,
    String? text,
    bool? isSelected,
  }) {
    return Variant(
      id: id ?? this.id,
      text: text ?? this.text,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}