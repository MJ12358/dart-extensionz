import 'dart:typed_data';

import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:test/test.dart';

void main() {
  test('toHex', () {
    final Uint8List bytes = Uint8List.fromList(<int>[0, 255, 16, 32]);
    final String hex = bytes.toHex();
    expect(hex, '00ff1020');
  });

  test('toStr', () {
    final Uint8List bytes = Uint8List.fromList(<int>[72, 101, 108, 108, 111]);
    final String str = bytes.toStr();
    expect(str, 'SGVsbG8=');
  });
}
