# Dart Extensions

A set of dart extensions that I use in various projects.

## Getting started

Add this to your `pubspec.yaml` under `dependencies`

```yaml
dart_extensions: ^1.0.0
```

## Usage

```dart
import 'package:dart_extensions/dart_extensions.dart';

int value = 12;
String result = value.ordinal;
expect(result, '12th');
```
