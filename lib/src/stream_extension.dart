extension StreamExtension<T> on Stream<T> {
  Stream<T> dumpError() {
    return handleError((Object error, StackTrace stackTrace) {
      // ignore: avoid_print
      print(error);
      // ignore: avoid_print
      print(stackTrace);
    });
  }
}
