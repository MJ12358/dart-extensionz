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

  /// Get a concrete type from a string.
  ///
  /// [runtimeType] is only for debugging purposes
  /// and application code shouldn't depend on it.
  /// It can be overridden by classes to return fake
  /// values and probably returns unusable
  /// values when transpiled to JS.
  Type toType() {
    String s = toString().toLowerCase();
    s = s.replaceAll(RegExp('<.*>'), '');
    s = s.replaceAll('_', '');
    if (s == 'bool') {
      return bool;
    }
    if (s == 'double') {
      return double;
    }
    if (s == 'enum') {
      return Enum;
    }
    if (s == 'future') {
      return Future;
    }
    if (s == 'int') {
      return int;
    }
    if (s == 'iterable') {
      return Iterable;
    }
    if (s == 'list') {
      return List;
    }
    if (s == 'map') {
      return Map;
    }
    if (s == 'never') {
      return Never;
    }
    if (s == 'num') {
      return num;
    }
    if (s == 'runes') {
      return Runes;
    }
    if (s == 'set') {
      return Set;
    }
    if (s == 'stream' || s == 'controllerstream') {
      return Stream;
    }
    if (s == 'string') {
      return String;
    }
    if (s == 'symbol') {
      return Symbol;
    }
    if (s == 'null') {
      return Null;
    }
    return Object;
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

  Type toType() => this == null ? Null : this!.toType();

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
