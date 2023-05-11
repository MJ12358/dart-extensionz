part of dart_extensionz;

extension SetExtension<T> on Set<T> {
  /// A clone of this [Set<T>].
  Set<T> get clone => Set<T>.from(this);

  /// Clone this set, then add [other] to it.
  Set<T> cloneAdd(Set<T> other) {
    final Set<T> result = clone;
    result.addAll(other);
    return result;
  }
}
