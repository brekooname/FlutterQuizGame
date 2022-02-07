class NumberService {
  static final NumberService singleton = NumberService.internal();

  factory NumberService() {
    return singleton;
  }

  NumberService.internal();

  static bool isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }
}
