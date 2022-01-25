extension StringExtension on String {
  String get capitalized {
    if(isEmpty){
      return this;
    }
    if(length == 1){
      return this[0].toUpperCase();
    }
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String get reversed => split('').reversed.join('');

  int get parseToInt => int.parse(replaceAll(RegExp("[^0-9.-]"), ''));

  double get parseToDouble => double.parse(replaceAll(RegExp("[^0-9.-]"), ''));
}
