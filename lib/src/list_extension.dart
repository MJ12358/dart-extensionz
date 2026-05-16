part of dart_extensionz;

/// [List] Extension.
extension ListExtension<T> on List<T?>? {
  /// Safely casts this list to a list of [R].
  List<R> castTo<R>() {
    if (this == null) {
      return <R>[];
    }
    return this!.whereType<R>().toList(growable: false);
  }

  /// A clone of this [List<T>].
  List<T> get clone => this != null ? List<T>.from(this!) : <T>[];

  /// Clone this list, then add [other] to it.
  List<T> cloneAdd(List<T> other) {
    final List<T> result = clone;
    result.addAll(other);
    return result;
  }

  /// Returns the last index integer.
  int get lastIndex => (this?.length ?? 0) - 1;

  /// Returns a random element from this list
  T? get random {
    if (this == null || isEmpty) {
      return null;
    }
    return this![math.Random().nextInt(this!.length)];
  }

  /// Remove null values from a list.
  ///
  /// The values can themselves be maps or lists.
  List<T> removeNull() {
    if (this == null) {
      return <T>[];
    }

    final List<T> result = <T>[];

    for (final Object? element in this!) {
      if (element == null) {
        continue;
      }

      final T cleaned = switch (element) {
        final List<Object?> list => list.removeNull() as T,
        final Map<Object?, Object?> map => map.removeNull() as T,
        _ => element as T,
      };

      result.add(cleaned);
    }

    return result;
  }

  /// Convert a list of objects to a list of enums from [values].
  List<R>? toEnum<R extends Enum>(List<Enum> values) {
    final List<String> list = castTo<String>();
    if (list.isEmpty) {
      return null;
    }
    final Map<String, Enum> nameMap = values.asNameMap();
    return list
        .map((String e) => nameMap[e])
        .whereType<R>()
        .toList(growable: false);
  }
}
