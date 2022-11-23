# Dart Extensions

## Getting started

Add this to your `pubspec.yaml` under `dependencies`

```yaml
dart_extensions:
  git: https://github.com/mj12358/dart-extensions
```

## Usage

```dart
import 'package:dart_extensions/dart_extensions.dart';

int value = 12;
String result = value.ordinal;
expect(result, '12th');
```
