part of dart_extensionz;

/// [Object] Extension.
extension ObjectExtension on Object {
  /// Determines if this [Object] is empty.
  bool get isEmpty {
    if (this is String) {
      return toString().trim().isEmpty;
    }
    if (this is Iterable) {
      final Iterable<dynamic> value = this as Iterable<dynamic>;
      return value.isEmpty;
    }
    if (this is Map) {
      final Map<dynamic, dynamic> value = this as Map<dynamic, dynamic>;
      return value.isEmpty;
    }
    return false;
  }
}

/// Nullable [Object] Extension.
extension NullableObjectExtension on Object? {
  /// Determines if this [Object] is empty.
  bool get isEmpty => this != null && this!.isEmpty;
}
