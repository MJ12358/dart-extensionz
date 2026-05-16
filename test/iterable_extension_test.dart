import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:test/test.dart';

void main() {
  test('chunks', () {
    expect(
      <int>[1, 2, 3, 4, 5, 6, 7, 8, 9].chunks(2).toList(),
      <List<int>>[
        <int>[1, 2],
        <int>[3, 4],
        <int>[5, 6],
        <int>[7, 8],
        <int>[9],
      ],
    );
    expect(<int>[1, 2, 3].chunks(1).toList(), <List<int>>[
      <int>[1],
      <int>[2],
      <int>[3],
    ]);
    expect(<int>[1, 2, 3].chunks(5).toList(), <List<int>>[
      <int>[1, 2, 3],
    ]);
    expect(<Object>[].chunks(2).toList(), <Object>[]);
  });

  test('containsIgnoreCase', () {
    expect(<String>['a', 'b', 'c'].containsIgnoreCase('A'), isTrue);
    expect(<String>['a', 'b', 'c'].containsIgnoreCase('B'), isTrue);
    expect(<String>['a', 'b', 'c'].containsIgnoreCase('C'), isTrue);
    expect(<String>['a', 'b', 'c'].containsIgnoreCase('D'), isFalse);
    expect(<Object>[1, 2, 3].containsIgnoreCase(1), isTrue);
    expect(<Object>[1, 2, 3].containsIgnoreCase(4), isFalse);
  });

  test('sum', () {
    expect(<int>[1, 2, 3].sum, 6);
    expect(<double>[1.5, 2.5, 3.5].sum, 7.5);
    expect(<int>[].sum, 0);
  });

  test('sum with null', () {
    expect(<int?>[1, 2, 3, null].sum, 6);
    expect(<double?>[1.5, 2.5, 3.5, null].sum, 7.5);
    expect(<int?>[null].sum, null);
    expect(<int?>[].sum, null);
  });

  test('average', () {
    expect(<int>[1, 2, 3].average, 2.0);
    expect(<double>[1.5, 2.5, 3.5].average, 2.5);
    expect(<int>[].average, 0);
  });

  test('average with null', () {
    expect(<int?>[1, 2, 3, null].average, 2.0);
    expect(<double?>[1.5, 2.5, 3.5, null].average, 2.5);
    expect(<int?>[null].average, null);
    expect(<int?>[].average, null);
  });

  test('max', () {
    expect(<int>[1, 2, 3].max, 3);
    expect(<int>[-1, -2, -3].max, -1);
    expect(<double>[1.5, 2.5, 3.5].max, 3.5);
    expect(<String>['a', 'b', 'c'].max, 'c');
  });

  test('max with null', () {
    expect(<int?>[1, 2, 3, null].max, 3);
    expect(<int?>[-1, -2, -3, null].max, -1);
    expect(<double?>[1.5, 2.5, 3.5, null].max, 3.5);
    expect(<String?>['a', 'b', 'c', null].max, 'c');
    expect(<int?>[null].max, null);
    expect(<int?>[].max, null);
  });

  test('min', () {
    expect(<int>[1, 2, 3].min, 1);
    expect(<int>[-1, -2, -3].min, -3);
    expect(<double>[1.5, 2.5, 3.5].min, 1.5);
    expect(<String>['a', 'b', 'c'].min, 'a');
  });

  test('min with null', () {
    expect(<int?>[1, 2, 3, null].min, 1);
    expect(<int?>[-1, -2, -3, null].min, -3);
    expect(<double?>[1.5, 2.5, 3.5, null].min, 1.5);
    expect(<String?>['a', 'b', 'c', null].min, 'a');
    expect(<int?>[null].min, null);
    expect(<int?>[].min, null);
  });

  test('max comparable', () {
    final List<Duration> result1 = <Duration>[
      const Duration(seconds: 1),
      const Duration(seconds: 2),
      const Duration(seconds: 3),
    ];
    final List<Duration> result2 = <Duration>[
      const Duration(seconds: 3),
      const Duration(seconds: 2),
      const Duration(seconds: 1),
      Duration.zero,
    ];
    expect(result1.max, const Duration(seconds: 3));
    expect(result2.max, const Duration(seconds: 3));
  });

  test('max comparable with null', () {
    final List<Duration?> result1 = <Duration?>[
      const Duration(seconds: 1),
      const Duration(seconds: 2),
      const Duration(seconds: 3),
      null,
    ];
    final List<Duration?> result2 = <Duration?>[
      const Duration(seconds: 3),
      const Duration(seconds: 2),
      const Duration(seconds: 1),
      Duration.zero,
      null,
    ];
    final List<Duration?> result3 = <Duration?>[null];
    expect(result1.max, const Duration(seconds: 3));
    expect(result2.max, const Duration(seconds: 3));
    expect(result3.max, null);
    expect(<Duration?>[].max, null);
  });

  test('min comparable', () {
    final List<Duration> result1 = <Duration>[
      const Duration(seconds: 1),
      const Duration(seconds: 2),
      const Duration(seconds: 3),
    ];
    final List<Duration> result2 = <Duration>[
      const Duration(seconds: 3),
      const Duration(seconds: 2),
      const Duration(seconds: 1),
      Duration.zero,
    ];
    expect(result1.min, const Duration(seconds: 1));
    expect(result2.min, Duration.zero);
  });

  test('min comparable with null', () {
    final List<Duration?> result1 = <Duration?>[
      const Duration(seconds: 1),
      const Duration(seconds: 2),
      const Duration(seconds: 3),
      null,
    ];
    final List<Duration?> result2 = <Duration?>[
      const Duration(seconds: 3),
      const Duration(seconds: 2),
      const Duration(seconds: 1),
      Duration.zero,
      null,
    ];
    final List<Duration?> result3 = <Duration?>[null];
    expect(result1.min, const Duration(seconds: 1));
    expect(result2.min, Duration.zero);
    expect(result3.min, null);
    expect(<Duration?>[].min, null);
  });
}
