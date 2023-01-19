import 'package:dart_extensionz/src/list_extension.dart';

extension MapExtension<K, V> on Map<K, V> {
  Map<K, V> removeNull() {
    return this
      ..removeWhere((K key, V value) => value == null)
      ..map((K key, V value) => MapEntry(
          key,
          value is List
              ? value.removeNull()
              : (value is Map ? value.removeNull() : value)));
  }
}
