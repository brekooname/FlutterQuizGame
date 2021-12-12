extension MapExtension on Map {
  V? get<T, V>(T key) {
    for (var v in entries) {
      if (v.key == key) {
        return v.value;
      }
    }
    return null;
  }

  V getOrDefault<T, V>(T key, V defaultValue) {
    for (var v in entries) {
      if (v.key == key) {
        return v.value;
      }
    }
    return defaultValue;
  }
}
