part of '../dart_extensionz.dart';

extension FutureExtension<T> on Future<T> {
  Future<T> delayed({
    Duration duration = const Duration(milliseconds: 350),
    bool eagerError = false,
    void Function(T)? cleanUp,
  }) async {
    final List<T> result = await Future.wait<T>(
      <Future<T>>[
        this,
        Future<T>.delayed(duration),
      ],
      eagerError: eagerError,
      cleanUp: cleanUp,
    );
    return result.first;
  }

  /// Dump any errors to the console
  ///
  /// Calls `catchError` while printing the `error` and `stackTrace`
  Future<T> dumpError() {
    return catchError((Object error, StackTrace stackTrace) {
      // ignore: avoid_print
      print(error);
      // ignore: avoid_print
      print(stackTrace);
    });
  }
}

extension FuturesExtension<T> on Iterable<Future<T>> {
  Future<void> progressWait(Function(num) callback) async {
    int completed = 0;
    void complete() {
      completed++;
      callback(completed / length);
    }

    await Future.wait<T>(
      <Future<T>>[
        for (final Future<T> future in this) future.whenComplete(complete)
      ],
    );
  }
}

extension FutureFunctionExtension<T> on Future<T> Function() {
  Future<T> delayed({
    Duration duration = const Duration(milliseconds: 350),
  }) async {
    return Future<T>.delayed(duration, this);
  }
}
