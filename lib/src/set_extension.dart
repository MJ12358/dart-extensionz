part of '../dart_extensionz.dart';

/// [Set] Extension.
extension SetExtension<T> on Set<T>? {
  /// A clone of this [Set<T>].
  Set<T> get clone => this != null ? Set<T>.from(this!) : <T>{};

  /// Clone this set, then add [other] to it.
  Set<T> cloneAdd(Set<T> other) {
    final Set<T> result = clone;
    result.addAll(other);
    return result;
  }
}
