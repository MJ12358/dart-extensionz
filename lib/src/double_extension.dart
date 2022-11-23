import 'dart:math';

enum RoundingMode { ceiling, floor, half }

extension DoubleExtension on double {
  double roundDouble({
    int places = 2,
    RoundingMode mode = RoundingMode.half,
  }) {
    final num mod = pow(10.0, places);
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

  double toPrecision(int fractionDigits) {
    final double mod = pow(10, fractionDigits.toDouble()).toDouble();
    return ((this * mod).round().toDouble() / mod);
  }
}
