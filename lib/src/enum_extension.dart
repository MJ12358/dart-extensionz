part of dart_extensionz;

/// [Enum] Extension.
extension EnumExtension on Enum {
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
extension EnumsExtension on Iterable<Enum> {
  /// Get all enum labels as a list.
  ///
  /// See `label` getter for details on what defines a label.
  List<String> get labels => map((Enum e) => e.label).toList();

  /// Get all enum names as a list.
  List<String> get names => asNameMap().keys.toList();

  /// Sort enums alphabetically.
  List<Enum> get alphabetical {
    final List<Enum> results = toList();
    results.sort((Enum a, Enum b) {
      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
    });
    return results;
  }
}

/// Nullable [Enum] Extension.
extension NullableEnumExtension on Enum? {
  /// Get a human readable display label for this enum.
  ///
  /// Splits by capital letters, prefered enum names are defined here:
  ///
  /// https://dart-lang.github.io/linter/lints/constant_identifier_names.html
  String get label {
    if (this == null) {
      return '';
    }
    return this!.label;
  }
}

/// Nullable [Iterable<Enum>] Extension.
extension NullableEnumsExtension on Iterable<Enum?>? {
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

    final Iterable<Enum> result = this!.toList().whereType<Enum>();

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

    final Iterable<Enum> result = this!.toList().whereType<Enum>();

    return result.isEmpty ? <String>[] : result.names;
  }
}
