part of dart_extensionz;

/// Indicates how the least significant returned digit
/// of a rounded result is to be calculated.
enum RoundingMode {
  ceiling,
  floor,
  half,
}

/// [double] Extension.
extension DoubleExtension on double {
  /// Returns the real part of this double.
  int get real => truncate();

  /// Returns the fractional part of this double.
  double get fractional {
    final List<String> parts = toString().split('.');
    if (parts.length != 2) {
      return 0;
    }
    return double.parse('${isNegative ? '-' : ''}0.${parts[1]}');
  }
}

extension NullableDoubleExtension on double? {
  /// Returns the real part of this double.
  int? get real => this?.real;

  /// Returns the fractional part of this double.
  double? get fractional => this?.fractional;
}
