part of dart_extensionz;

extension StreamExtension<T> on Stream<T> {
  /// Dump any errors to the console.
  ///
  /// Calls [handleError] while printing the `error` and `stackTrace`.
  Stream<T> dumpError() {
    return handleError((Object error, StackTrace stackTrace) {
      // ignore: avoid_print
      print(error);
      // ignore: avoid_print
      print(stackTrace);
    });
  }
}
