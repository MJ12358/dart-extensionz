extension FutureExtension<T> on Future<T> {
  Future<T> delayed({
    Duration duration = const Duration(milliseconds: 350),
    bool eagerError = false,
    void Function(T)? cleanUp,
  }) async {
    final List<T> result = await Future.wait<T>(
      [
        this,
        Future.delayed(duration),
      ],
      eagerError: eagerError,
      cleanUp: cleanUp,
    );
    return result.first;
  }

  Future<T> dumpError() {
    return catchError((error, stackTrace) {
      print(error);
      print(stackTrace);
    });
  }
}

extension FuturesExtension<T> on Iterable<Future<T>> {
  void progressWait(Function(num) callback) async {
    int completed = 0;
    void complete() {
      completed++;
      callback(completed / length);
    }

    await Future.wait<T>(
        [for (final Future<T> future in this) future.whenComplete(complete)]);
  }
}

extension FutureFunctionExtension<T> on Future<T> Function() {
  Future<T> delayed({
    Duration duration = const Duration(milliseconds: 350),
  }) async {
    return Future.delayed(duration, this);
  }
}
