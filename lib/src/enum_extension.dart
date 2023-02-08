part of '../dart_extensionz.dart';

extension EnumExtension on Enum {
  /// Get a human readable display label for this enum
  ///
  /// Splits by capital letters, prefered enum names are defined here:
  ///
  /// https://dart-lang.github.io/linter/lints/constant_identifier_names.html
  String get label {
    final RegExp pattern = RegExp('(?<=[a-z])(?=[A-Z_])');
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
