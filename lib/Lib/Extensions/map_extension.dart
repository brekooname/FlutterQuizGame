

extension MapExtension on Map {
  V? get<T, V>(T key) {
    for (var v in this.entries) {
      if (v.key == key) {
        return v.value;
      }
    }
    return null;
  }
}
