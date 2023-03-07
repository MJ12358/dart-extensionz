part of dart_extensionz;

enum RoundingMode {
  ceiling,
  floor,
  half,
}

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
        break;
      case RoundingMode.floor:
        temp = (this * mod).floor();
        break;
      case RoundingMode.half:
      default:
        temp = (this * mod).round();
    }

    return temp / mod;
  }
}
