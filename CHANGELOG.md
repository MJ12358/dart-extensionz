# Dart Extensionz

## 5.1.0

- Add `Intl` to aid in formatting Dates, Durations and Numbers.

## 5.0.0

- **BREAKING**:
  - Fix depreciated `Platform` instancing.
  - This means `Platform().<>` will become `PlatformExtension.<>`.

## 4.7.1

- Improve clock parsing in StringExtension.toDateTime.

## 4.7.0

- Add clock parsing to StringExtension.toDateTime.

## 4.6.0

- Add more convenience methods to StringExtension.

## 4.5.0

- Add `first` and `last` to StringExtension.

## 4.4.0

- Add `increment` to FileExtension.
- Add `toCompassPoint` to NumberExtension.

## 4.3.1

- Add/modify some comments.
- Update env sdk.

## 4.3.0

- Add `truncate` to StringExtension.

## 4.2.0

- Add `changeName` and `changeDisplayName` to FileExtension.

## 4.1.0

- Add `write` to FileExtension.

## 4.0.0

- Add `FileExtension.displayName` to output name without the extension.
- Add negations to `StringExtension`.
- Change `NumberExtension` durations into methods for consistency.
- Change `StringExtension` titleCase into a method for consistency.

## 3.2.0

- Add `FileSystemEntity` extension.
- Add `humanize` to numbers.
- Allow digits in enum labels.

## 3.1.0

- Add `fractional` to DoubleExtension
- Add NullableEnum extensions
- Add `name` to FileExtension
- Add `random` to ListExtension
- Add `length` to NumberExtension

## 3.0.0

- Fix a typo in a getter name.
- Remove unit conversion in favor of another library.

## 2.0.1

- Add some more conveniences.

## 2.0.0

- **BREAKING**:
  - Use `part` and `part of` instead of imports.
  - This is to ensure only the `dart_extensionz.dart` file can be imported.
  - Move `toPrecision` into `NumberExtension`.

## 1.4.0

- Use better lint rules. Add `File.size()` and more.

## 1.3.0

- Fix DateTime isSameDay, add more String extensions and introduce File and Future extensions.

## 1.2.1

- Fix EnumExtension to allow Iterable

## 1.2.0

- Introduce `EnumExtension`.

## 1.1.0

- Introduce `PlatformExtension`.

## 1.0.2

- Add some comments and extra String methods.

## 1.0.1

- Update readme.

## 1.0.0

- Initial version.
