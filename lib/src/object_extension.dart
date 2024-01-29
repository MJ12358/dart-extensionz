part of dart_extensionz;

/// [Object] Extension.
extension ObjectExtension on Object {
  /// Determines if this [Object] is empty.
  bool get isEmpty {
    if (this is String) {
      return toString().isEmpty;
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

  bool get isBlank {
    if (this is String) {
      return toString().isBlank;
    }
    if (this is Iterable) {
      final Iterable<Object?> value = this as Iterable<Object?>;
      return value.every((Object? e) => e.isBlank);
    }
    if (this is Map) {
      final Map<Object?, Object?> value = this as Map<Object?, Object?>;
      return value.entries.every(
        (MapEntry<Object?, Object?> e) => e.value.isBlank,
      );
    }
    return false;
  }
}

/// Nullable [Object] Extension.
extension NullableObjectExtension on Object? {
  /// Determines if this [Object] is empty.
  bool get isEmpty => this == null || this!.isBlank;

  bool get isBlank => this == null || this!.isBlank;
}
