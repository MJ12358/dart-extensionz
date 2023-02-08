part of '../dart_extensionz.dart';

extension IntegerExtension on int {
  /// Get the ordinal of this integer
  ///
  /// Example: 3 == 3rd, 10 == 10th
  String get ordinal {
    if (this == 11 || this == 12 || this == 13) {
      return '${this}th';
    }
    if (this % 10 == 1) {
      return '${this}st';
    }
    if (this % 10 == 2) {
      return '${this}nd';
    }
    if (this % 10 == 3) {
      return '${this}rd';
    }
    return '${this}th';
  }
}
