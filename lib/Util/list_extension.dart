extension ListExtension on List {
  void removeAll<T>(Iterable<T> toRemove) {
    for (T val in toRemove) {
      this.remove(val);
    }
  }
}
