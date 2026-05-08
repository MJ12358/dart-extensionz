import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:test/test.dart';

void main() {
  test('get from map', () {
    final Map<String, Object?> map = <String, Object?>{
      'a': 1,
      'b': 2,
      'c': 3,
      'd': 'test',
      'e': null,
    };

    // Expected values
    expect(map.get<int>('a'), 1);
    expect(map.get<int>('b'), 2);
    expect(map.get<int>('c'), 3);
    expect(map.get<String>('d'), 'test');
    expect(map.get<String>('e'), isNull);
    // Incorrect types
    expect(map.get<String>('a'), isNull);
    expect(map.get<String>('b'), isNull);
    expect(map.get<String>('c'), isNull);
    expect(map.get<int>('d'), isNull);
    expect(map.get<String>('e'), isNull);
  });

  test('get from nullable map', () {
    Map<String, Object?>? map;
    map = <String, Object?>{
      'a': 1,
      'b': 2,
      'c': 3,
      'd': 'test',
      'e': null,
    };

    // Expected values
    expect(map.get<int>('a'), 1);
    expect(map.get<int>('b'), 2);
    expect(map.get<int>('c'), 3);
    expect(map.get<String>('d'), 'test');
    expect(map.get<String>('e'), isNull);
    // Incorrect types
    expect(map.get<String>('a'), isNull);
    expect(map.get<String>('b'), isNull);
    expect(map.get<String>('c'), isNull);
    expect(map.get<int>('d'), isNull);
    expect(map.get<String>('e'), isNull);
  });

  test('removeNull from map', () {
    final Map<String, Object?> map = <String, Object?>{
      'a': 1,
      'b': null,
      'c': <String?>['x', null, 'y'],
      'd': <String, Object?>{'nested': null},
    };

    final Map<String, Object?> expected = <String, Object?>{
      'a': 1,
      'c': <String>['x', 'y'],
      'd': <String, Object?>{},
    };

    expect(map.removeNull(), expected);
  });
}
