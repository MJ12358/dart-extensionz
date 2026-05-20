part of '../dart_extensionz.dart';

/// [Enum] Extension.
extension EnumExtension<T> on Enum? {
  /// Get a human readable display label for this enum.
  ///
  /// Splits by capital letters, prefered enum names are defined here:
  ///
  /// https://dart-lang.github.io/linter/lints/constant_identifier_names.html
  String get label {
    if (this == null) {
      return '';
    }
    final RegExp pattern = RegExp(r'(?<=[a-z])(?=[A-Z_\d])');
    final List<String> parts = this!.name.split(pattern);
    return parts.map((String e) => e.replaceAll('_', '').capitalize).join(' ');
  }
}

/// [Iterable<Enum>] Extension.
extension EnumsExtension<T> on Iterable<Enum?>? {
  /// Get all enum labels as a list.
  ///
  /// See `label` getter for details on what defines a label.
  List<String> get labels {
    if (this == null) {
      return <String>[];
    }
    return this!
        .whereType<Enum>()
        .map((Enum? e) => e?.label ?? '')
        .toList(growable: false);
  }

  /// Get all enum names as a list.
  List<String> get names {
    if (this == null) {
      return <String>[];
    }
    return this!.whereType<Enum>().asNameMap().keys.toList(growable: false);
  }

  /// Sort enums alphabetically.
  List<Enum> get alphabetical {
    if (this == null) {
      return <Enum>[];
    }
    final List<Enum> results = this!.whereType<Enum>().toList(growable: false);
    results.sort((Enum a, Enum b) {
      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
    });
    return results;
  }

  /// Get a random enum from this iterable.
  Enum get random {
    if (this == null) {
      throw StateError('Cannot get random enum from null iterable');
    }
    final List<Enum> results = this!.whereType<Enum>().toList(growable: false);
    results.shuffle();
    return results.first;
  }

  /// Get an enum from a [String].
  ///
  /// Works like [byName!] except won't throw if not found
  /// and allows fuzzy string matching by removing spaces and underscores.
  T? get(String? element) {
    if (element == null || this == null) {
      return null;
    }

    final String value =
        element.replaceAll(RegExp(r'[\s_]+'), '').toLowerCase();

    final Map<String, Enum> map = this!.whereType<Enum>().asNameMap().map(
          (String key, Enum value) =>
              MapEntry<String, Enum>(key.toLowerCase(), value),
        );

    return map[value] as T?;
  }
}
