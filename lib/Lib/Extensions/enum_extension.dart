extension EnumExtension on Enum {
  String name() {
    return this.toString().split('.').last;
  }

}
