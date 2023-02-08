part of '../dart_extensionz.dart';

extension BooleanExtension on bool {
  /// Convert this bool to either 1 or 0
  int toInt() {
    return this ? 1 : 0;
  }

  /// Convert this bool to either "Yes" or "No"
  String toYesNo() {
    return this ? 'Yes' : 'No';
  }
}
