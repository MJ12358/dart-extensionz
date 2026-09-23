part of '../dart_extensionz.dart';

/// [Uint8List] Extension.
extension Uint8ListExtension on Uint8List {
  /// Converts the [Uint8List] to a hexadecimal [String].
  String toHex() {
    return map((int byte) => byte.toRadixString(16).padLeft(2, '0')).join();
  }

  /// Converts the [Uint8List] to a [String]
  /// using Base64 encoding if possible,
  /// or falling back to UTF-8 decoding.
  String toStr() {
    try {
      return base64.encode(this);
    } on FormatException {
      return String.fromCharCodes(this);
    }
  }
}

/// Nullable [Uint8List] Extension.
extension NullableUint8ListExtension on Uint8List? {
  /// Converts the nullable [Uint8List] to a hexadecimal [String],
  /// or returns null if the [Uint8List] is null.
  String? toHex() {
    if (this == null) {
      return null;
    }
    return this!.toHex();
  }

  /// Converts the nullable [Uint8List] to a [String]
  /// using Base64 encoding if possible,
  /// or falling back to UTF-8 decoding,
  /// or returns null if the [Uint8List] is null.
  String? toStr() {
    if (this == null) {
      return null;
    }
    return this!.toStr();
  }
}
