part of '../dart_extensionz.dart';

/// [Object] Extension.
extension ObjectExtension on Object? {
  /// Determines if this [Object] is empty.
  bool get isEmpty {
    if (this == null) {
      return true;
    }
    if (this is String) {
      return toString().isEmpty;
    }
    if (this is Iterable) {
      final Iterable<dynamic> value = this! as Iterable<dynamic>;
      return value.isEmpty;
    }
    if (this is Map) {
      final Map<dynamic, dynamic> value = this! as Map<dynamic, dynamic>;
      return value.isEmpty;
    }
    return false;
  }

  /// Determines if this [Object] is blank.
  bool get isBlank {
    if (this == null) {
      return true;
    }
    if (this is String) {
      return toString().isBlank;
    }
    if (this is Iterable) {
      final Iterable<Object?> value = this! as Iterable<Object?>;
      return value.every((Object? e) => e.isBlank);
    }
    if (this is Map) {
      final Map<Object?, Object?> value = this! as Map<Object?, Object?>;
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

  /// Determines if this [Object] is [bool].
  bool get isBool => this is bool;

  /// Determines if this [Object] is [double].
  bool get isDouble => this is double;

  /// Determines if this [Object] is [Enum].
  bool get isEnum => this is Enum;

  /// Determines if this [Object] is [Future].
  bool get isFuture => this is Future;

  /// Determines if this [Object] is [int].
  bool get isInt => this is int;

  /// Determines if this [Object] is [Iterable].
  bool get isIterable => this is Iterable;

  /// Determines if this [Object] is [List].
  bool get isList => this is List;

  /// Determines if this [Object] is [Map].
  bool get isMap => this is Map;

  /// Determines if this [Object] is [num].
  bool get isNum => this is num;

  /// Determines if this [Object] is [Runes].
  bool get isRunes => this is Runes;

  /// Determines if this [Object] is [Set].
  bool get isSet => this is Set;

  /// Determines if this [Object] is [Stream].
  bool get isStream => this is Stream;

  /// Determines if this [Object] is [String].
  bool get isString => this is String;

  /// Determines if this [Object] is [Symbol].
  bool get isSymbol => this is Symbol;
}
