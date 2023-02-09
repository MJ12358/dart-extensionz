# Dart Extensionz

A set of [Dart](https://dart.dev) extensions I use in various projects.

## Usage

```dart
import 'package:dart_extensionz/dart_extensionz.dart';

int value = 12;
String result = value.ordinal;
expect(result, '12th');


String value = '   Jon        Snow     ';
String result = jonSnow.normalizeSpace();
expect(result, 'Jon Snow');
```
