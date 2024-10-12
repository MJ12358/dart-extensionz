# Dart Extensionz

![pub package](https://img.shields.io/pub/v/dart_extensionz)

A set of [Dart](https://dart.dev) extensions I use in various projects.

## Usage

### Booleans

- To Int

```dart
bool value = false;
int result = value.toInt();
expect(result, 0);
```

### DateTimes

- Is Leap Year

```dart
DateTime value = DateTime(2020);
bool result = value.isLeapYear;
expect(result, true);
```

### Durations

- Getters

```dart
Duration value = Duration(days: 1, hours: 5, minutes: 10);
expect(value.days, 1);
expect(value.hours, 5);
expect(value.minutes: 10);
```

### Integers

- Ordinal

```dart
int value = 12;
String result = value.ordinal;
expect(result, '12th');
```

### Strings

- Normalize Space

```dart
String value = '   Jon        Snow     ';
String result = value.normalizeSpace();
expect(result, 'Jon Snow');
```

- Mask

```dart
String value = 'Testing';
expect(value.mask(), '####ing');
expect(value.mask(end: value.length, char: '*'), '*******');
```

### Files

```dart
File file = File('/documents/MyAwesomeFile.txt');
expect(file.name, 'MyAwesomeFile.txt');
expect(file.displayName, 'MyAwesomeFile');
expect(file.extension, 'txt');
```

### Uris

```dart
Uri value = Uri(host: 'google.com');
value.addPath('search');
value.addQuery('q', 'test');
```

- The [generated documentation](https://pub.dev/documentation/dart_extensionz/latest/dart_extensionz/dart_extensionz-library.html) will give you a great overview of all that is available.
