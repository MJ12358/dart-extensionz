part of dart_extensionz;

enum TargetPlatform {
  android,
  iOS,
  fuchsia,
  linux,
  macOS,
  windows,
  unknown,
}

extension PlatformExtension on Platform {
  bool get isMobile => Platform.isAndroid || Platform.isIOS;

  bool get isDesktop =>
      Platform.isWindows || Platform.isMacOS || Platform.isLinux;

  /// Get the target plaform as an enum.
  ///
  /// This requires the caller to instance
  /// the `Plaform` class as `Platform()`.
  ///
  /// This is due to this issue:
  /// https://github.com/dart-lang/language/issues/723
  TargetPlatform get target {
    if (Platform.isAndroid) {
      return TargetPlatform.android;
    }
    if (Platform.isIOS) {
      return TargetPlatform.iOS;
    }
    if (Platform.isFuchsia) {
      return TargetPlatform.fuchsia;
    }
    if (Platform.isLinux) {
      return TargetPlatform.linux;
    }
    if (Platform.isMacOS) {
      return TargetPlatform.macOS;
    }
    if (Platform.isWindows) {
      return TargetPlatform.windows;
    }
    return TargetPlatform.unknown;
  }
}
