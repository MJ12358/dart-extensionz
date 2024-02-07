part of dart_extensionz;

/// [bool] Extension.
extension BooleanExtension on bool {
  /// Convert this bool to either 1 or 0.
  int toInt() {
    return this ? 1 : 0;
  }

  /// Convert this bool to either "Yes" or "No".
  String toYesNo() {
    return this ? 'Yes' : 'No';
  }

  /// Convert this bool to either "Y" or "N".
  String toYN() {
    return this ? 'Y' : 'N';
  }
}

/// Nullable [bool] Extension.
extension NullableBooleanExtension on bool? {
  int toInt() {
    return this == null ? 0 : this!.toInt();
  }

  String toYesNo() {
    return this == null ? 'No' : this!.toYesNo();
  }

  String toYN() {
    return this == null ? 'N' : this!.toYN();
  }
}
