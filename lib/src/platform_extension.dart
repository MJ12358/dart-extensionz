part of dart_extensionz;

/// The platform that user interaction should adapt to target.
enum TargetPlatform {
  android,
  iOS,
  fuchsia,
  linux,
  macOS,
  windows,
  unknown,
}

/// [Platform] Extension.
extension PlatformExtension on Platform {
  /// Determines if this [Platform] is mobile.
  static bool get isMobile => Platform.isAndroid || Platform.isIOS;

  /// Determines if this [Platform] is desktop.
  static bool get isDesktop =>
      Platform.isWindows || Platform.isMacOS || Platform.isLinux;

  /// A constant that is true if the application was compiled to run on the web.
  // ignore: do_not_use_environment
  static const bool isWeb = bool.fromEnvironment('dart.library.js_util');

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
