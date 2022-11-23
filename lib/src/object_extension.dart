extension ObjectExtension on Object {
  bool get isEmpty {
    if (this is String) {
      return toString().trim().isEmpty;
    }
    if (this is Iterable) {
      Iterable value = this as Iterable;
      return value.isEmpty;
    }
    if (this is Map) {
      Map value = this as Map;
      return value.isEmpty;
    }
    return false;
  }
}
