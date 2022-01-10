

class QuestionDifficulty {
  int index;

  QuestionDifficulty({required this.index});

  String get name {
    return "diff" + index.toString();
  }

  @override
  String toString() {
    return 'QuestionDifficulty{name: $name}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionDifficulty && index == other.index && name == other.name;

  @override
  int get hashCode => index.hashCode ^ name.hashCode;
}
