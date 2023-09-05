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

/// I'd love to have statics directly on `Platform`,
/// but unfortunately cannot do so.
///
/// https://github.com/dart-lang/language/issues/723
extension PlatformExtension on Platform {
  static bool get isMobile => Platform.isAndroid || Platform.isIOS;

  static bool get isDesktop =>
      Platform.isWindows || Platform.isMacOS || Platform.isLinux;

  /// Get the target plaform as an enum.
  static TargetPlatform get target {
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
