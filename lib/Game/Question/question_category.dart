import 'CategoryService/question_category_service.dart';

class QuestionCategory {
  int index;
  String name;
  QuestionCategoryService questionCategoryService;

  QuestionCategory(
      {required this.index,
      required this.name,
      required this.questionCategoryService});

  @override
  String toString() {
    return 'QuestionCategory{name: $name}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionCategory &&
          index == other.index &&
          name == other.name;

  @override
  int get hashCode => index.hashCode ^ name.hashCode;
}
