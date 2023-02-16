part of dart_extensionz;

enum RoundingMode {
  ceiling,
  floor,
  half,
}

extension DoubleExtension on double {
  /// Round a double
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
