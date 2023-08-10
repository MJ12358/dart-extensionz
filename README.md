# Dart Extensionz

![pub package](https://img.shields.io/pub/v/dart_extensionz)

A set of [Dart](https://dart.dev) extensions I use in various projects.

## Usage

- Ordinal

```dart
int value = 12;
String result = value.ordinal;
expect(result, '12th');
```

- Normalize Space

```dart
String value = '   Jon        Snow     ';
String result = value.normalizeSpace();
expect(result, 'Jon Snow');
```

- Files

```dart

File file = File('/documents/MyAwesomeFile.txt');
expect(file.name, 'MyAwesomeFile.txt');
expect(file.displayName, 'MyAwesomeFile');
expect(file.extension, 'txt');
```

- Mask

```dart
String value = 'Testing';
expect(value.mask(), '####ing');
expect(value.mask(end: value.length, char: '*'), '*******');
```

- The [generated documentation](https://pub.dev/documentation/dart_extensionz/latest/dart_extensionz/dart_extensionz-library.html) will give you a great overview of all that is available.
