part of dart_extensionz;

extension EnumExtension on Enum {
  /// Get a human readable display label for this enum
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

extension EnumsExtension on Iterable<Enum> {
  /// Get all enum labels as a list
  ///
  /// See `label` getter for details on what defines a label
  List<String> get labels => map((Enum e) => e.label).toList();

  /// Get all enum names as a list
  List<String> get names => asNameMap().keys.toList();
}

extension NullableEnumExtension on Enum? {
  /// Get a human readable display label for this enum
  ///
  /// Splits by capital letters, prefered enum names are defined here:
  ///
  /// https://dart-lang.github.io/linter/lints/constant_identifier_names.html
  String get label {
    if (this == null) {
      return '';
    }
    final Enum result = this!;
    return result.label;
  }
}

extension NullableEnumsExtension on Iterable<Enum?>? {
  /// Get all enum labels as a list
  ///
  /// See `label` getter for details on what defines a label
  ///
  /// When a null iterable is passed or all entries are null
  /// this returns an empty list
  List<String> get labels {
    if (this == null) {
      return <String>[];
    }

    final Iterable<Enum> result = this!.toList().whereType<Enum>();

    if (result.isEmpty) {
      return <String>[];
    }

    return result.labels;
  }

  /// Get all enum names as a list
  ///
  /// When a null iterable is passed or all entries are null
  /// this returns an empty list
  List<String> get names {
    if (this == null) {
      return <String>[];
    }

    final Iterable<Enum> result = this!.toList().whereType<Enum>();

    if (result.isEmpty) {
      return <String>[];
    }

    return result.names;
  }
}
