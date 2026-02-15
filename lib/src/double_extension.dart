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

  /// Round a double.
  ///
  /// Use [mode] to specify ceil, floor or half (default)
  double roundDouble({
    int places = 2,
    RoundingMode mode = RoundingMode.half,
  }) {
    final num mod = math.pow(10.0, places);
    final int temp;

    switch (mode) {
      case RoundingMode.ceiling:
        temp = (this * mod).ceil();
      case RoundingMode.floor:
        temp = (this * mod).floor();
      case RoundingMode.half:
        temp = (this * mod).round();
    }

    return temp / mod;
  }
}

extension NullableDoubleExtension on double? {
  /// Returns the real part of this double.
  int? get real => this?.real;

  /// Returns the fractional part of this double.
  double? get fractional => this?.fractional;

  /// Round a double.
  ///
  /// Use [mode] to specify ceil, floor or half (default)
  double? roundDouble({
    int places = 2,
    RoundingMode mode = RoundingMode.half,
  }) {
    return this?.roundDouble(places: places, mode: mode);
  }
}
