extension StringExtension on String {
  String get capitalized => "${this[0].toUpperCase()}${this.substring(1)}";

  String get reversed => this.split('').reversed.join('');

  int get parseToInt => int.parse(this.replaceAll(RegExp("[^0-9.-]"), ''));
}
