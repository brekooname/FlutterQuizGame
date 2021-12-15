extension EnumExtension on Enum {
  String get name => this.toString().split('.').last;
}
