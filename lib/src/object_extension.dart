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

  /// Determines if this [Object] is blank.
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

  bool get isBool => this is bool;
  bool get isDouble => this is double;
  bool get isEnum => this is Enum;
  bool get isFuture => this is Future;
  bool get isInt => this is int;
  bool get isIterable => this is Iterable;
  bool get isList => this is List;
  bool get isMap => this is Map;
  bool get isNum => this is num;
  bool get isRunes => this is Runes;
  bool get isSet => this is Set;
  bool get isStream => this is Stream;
  bool get isString => this is String;
  bool get isSymbol => this is Symbol;
}

/// Nullable [Object] Extension.
extension NullableObjectExtension on Object? {
  /// Determines if this [Object] is empty.
  bool get isEmpty => this == null || this!.isBlank;

  /// Determines if this [Object] is blank.
  bool get isBlank => this == null || this!.isBlank;

  bool get isBool => this != null && this!.isBool;
  bool get isDouble => this != null && this!.isDouble;
  bool get isEnum => this != null && this!.isEnum;
  bool get isFuture => this != null && this!.isFuture;
  bool get isInt => this != null && this!.isInt;
  bool get isIterable => this != null && this!.isIterable;
  bool get isList => this != null && this!.isList;
  bool get isMap => this != null && this!.isMap;
  bool get isNum => this != null && this!.isNum;
  bool get isRunes => this != null && this!.isRunes;
  bool get isSet => this != null && this!.isSet;
  bool get isStream => this != null && this!.isStream;
  bool get isString => this != null && this!.isString;
  bool get isSymbol => this != null && this!.isSymbol;
}
