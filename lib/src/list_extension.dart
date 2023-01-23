import 'package:dart_extensionz/src/map_extension.dart';

extension ListExtension<T> on List<T> {
  /// Remove null values from a list
  ///
  /// The values can themselves maps or lists
  List<T> removeNull() {
    return this
      ..removeWhere((T value) => value == null)
      ..map((T value) => value is List
          ? value.removeNull()
          : (value is Map ? value.removeNull() : value)).toList();
  }
}
