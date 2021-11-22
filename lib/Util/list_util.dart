class ListUtil {

  static List<T> removeAll<T>(Iterable<T> parentList, Iterable<T> toRemove) {
    var set1 = Set.from(parentList);
    var set2 = Set.from(toRemove);
    return List.from(set1.difference(set2));
  }
}
