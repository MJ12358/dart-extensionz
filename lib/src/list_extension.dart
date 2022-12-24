import 'package:dart_extensions/src/map_extension.dart';

extension ListExtension<T> on List<T> {
  List<T> removeNull() {
    return this
      ..removeWhere((T value) => value == null)
      ..map((T value) => value is List
          ? value.removeNull()
          : (value is Map ? value.removeNull() : value)).toList();
  }
}
