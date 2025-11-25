part of dart_extensionz;

/// [Enum] Extension.
extension EnumExtension<T> on Enum {
  /// Get a human readable display label for this enum.
  ///
  /// Splits by capital letters, prefered enum names are defined here:
  ///
  /// https://dart-lang.github.io/linter/lints/constant_identifier_names.html
  String get label {
    final RegExp pattern = RegExp(r'(?<=[a-z])(?=[A-Z_\d])');
    final List<String> parts = name.split(pattern);
    return parts.map((String e) => e.replaceAll('_', '').capitalize).join(' ');
  }
}

/// [Iterable<Enum>] Extension.
extension EnumsExtension<T> on Iterable<Enum> {
  /// Get all enum labels as a list.
  ///
  /// See `label` getter for details on what defines a label.
  List<String> get labels => map((Enum e) => e.label).toList(growable: false);

  /// Get all enum names as a list.
  List<String> get names => asNameMap().keys.toList(growable: false);

  /// Sort enums alphabetically.
  List<Enum> get alphabetical {
    final List<Enum> results = toList(growable: false);
    results.sort((Enum a, Enum b) {
      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
    });
    return results;
  }

  /// Get an enum from a [String].
  ///
  /// Works like [byName] except won't throw if not found
  /// and allows fuzzy string matching by removing spaces and underscores.
  T? get(String? element) {
    if (element == null) {
      return null;
    }

    final String value =
        element.replaceAll(RegExp(r'[\s_]+'), '').toLowerCase();

    final Map<String, Enum> map = asNameMap().map(
      (String key, Enum value) =>
          MapEntry<String, Enum>(key.toLowerCase(), value),
    );

    return map[value] as T?;
  }
}

/// Nullable [Enum] Extension.
extension NullableEnumExtension<T> on Enum? {
  /// Get a human readable display label for this enum.
  ///
  /// Splits by capital letters, prefered enum names are defined here:
  ///
  /// https://dart-lang.github.io/linter/lints/constant_identifier_names.html
  String get label => this == null ? '' : this!.label;
}

/// Nullable [Iterable<Enum>] Extension.
extension NullableEnumsExtension<T> on Iterable<Enum?>? {
  /// Get all enum labels as a list.
  ///
  /// See `label` getter for details on what defines a label.
  ///
  /// When a null iterable is passed or all entries are null
  /// this returns an empty list.
  List<String> get labels {
    if (this == null) {
      return <String>[];
    }
    final Iterable<Enum> result =
        this!.toList(growable: false).whereType<Enum>();
    return result.isEmpty ? <String>[] : result.labels;
  }

  /// Get all enum names as a list.
  ///
  /// When a null iterable is passed or all entries are null
  /// this returns an empty list.
  List<String> get names {
    if (this == null) {
      return <String>[];
    }
    final Iterable<Enum> result =
        this!.toList(growable: false).whereType<Enum>();
    return result.isEmpty ? <String>[] : result.names;
  }
}
