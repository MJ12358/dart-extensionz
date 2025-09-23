# Dart Extensionz

## [7.1.6]

- Fix `wordToNumber` to account for empty integer part when handling decimals.

## [7.1.5]

- Fix `levenshtein` when working with large strings.

## [7.1.4]

- Fix `wordToNumber` to accomidate multipliers in integer spaces.

## [7.1.2]

- Fix `wordToNumber` to accomidate decimals.

## [7.1.1]

- Modify `wordToNumber` to output null incase of an invalid string.

## [7.1.0]

- Add `wordToNumber` to `StringExtension`.
- Add `minusMilliMicro` to `DateTimeExtension`.
- Fix `ObjectExtension` `isEmpty` to utilize Dart.

## [7.0.2]

- Update dependencies.
- Raise minimum dart version.

## [6.4.0]

- Add `FileType` extension lists.

## [6.3.5]

- Add `isAscii` to `StringExtension`.
- Add `daysInMonth` to `DateTimeExtension`.

## [6.3.4]

- Add `toWeekDay` to `NumberExtension`.

## [6.3.3]

- Add `week` getter to `DateTimeExtension`.

## [6.3.2]

- Fix some datetime issues retrieving `endOf` and `startOf`.

## [6.3.1]

- Move the `computerize` function into the public api.

## [6.3.0]

- Introduce `UriExtension`.

## [6.2.0]

- Add `toEnum` on List and String extensions.

## [6.1.0]

- Add `toCamelCase` and `fromCamelCase`.

## [6.0.1]

- Fix return type of enum getter.

## [6.0.0]

- Add `NullableBooleanExtension`.
- Rename sum and average functions.
- Modify `Cardinal` directions.
- Add convienent type checkers to `ObjectExtension`.
- Add a fuzzy getter to `Iterable<Enum>`.
- Add a few more tests.

## [5.4.2]

- Add `isBlank` to `ObjectExtension`.
- Fix null checking within `isEmpty`.

## [5.4.1]

- Fix `toDuration` for more cases.

## [5.4.0]

- Add `timeAgo` to `DateTimeExtension`.

## [5.3.2]

- Fix typo.

## [5.3.1]

- Fix possible issues with intl not updating locale.

## [5.3.0]

- Add `alphabetical` to `EnumsExtension`.

## [5.2.5]

- Fix nullable DateTime in `humanize`.

## [5.2.4]

- Adjust DateTime equatables.

## [5.2.3]

- Add `containsIgnoreCase` to `IterableExtension`.

## [5.1.2]

- Hotfix some date/duration pattern matching.

## [5.1.1]

- Upload missing DateTime ext.

## [5.1.0]

- Add `Intl` to aid in formatting Dates, Durations and Numbers.

## [5.0.0]

- **BREAKING**:
  - Fix depreciated `Platform` instancing.
  - This means `Platform().<>` will become `PlatformExtension.<>`.

## [4.7.1]

- Improve clock parsing in StringExtension.toDateTime.

## [4.7.0]

- Add clock parsing to StringExtension.toDateTime.

## [4.6.0]

- Add more convenience methods to StringExtension.

## [4.5.0]

- Add `first` and `last` to StringExtension.

## [4.4.0]

- Add `increment` to FileExtension.
- Add `toCompassPoint` to NumberExtension.

## [4.3.1]

- Add/modify some comments.
- Update env sdk.

## [4.3.0]

- Add `truncate` to StringExtension.

## [4.2.0]

- Add `changeName` and `changeDisplayName` to FileExtension.

## [4.1.0]

- Add `write` to FileExtension.

## [4.0.0]

- Add `FileExtension.displayName` to output name without the extension.
- Add negations to `StringExtension`.
- Change `NumberExtension` durations into methods for consistency.
- Change `StringExtension` titleCase into a method for consistency.

## [3.2.0]

- Add `FileSystemEntity` extension.
- Add `humanize` to numbers.
- Allow digits in enum labels.

## [3.1.0]

- Add `fractional` to DoubleExtension
- Add NullableEnum extensions
- Add `name` to FileExtension
- Add `random` to ListExtension
- Add `length` to NumberExtension

## [3.0.0]

- Fix a typo in a getter name.
- Remove unit conversion in favor of another library.

## [2.0.1]

- Add some more conveniences.

## [2.0.0]

- **BREAKING**:
  - Use `part` and `part of` instead of imports.
  - This is to ensure only the `dart_extensionz.dart` file can be imported.
  - Move `toPrecision` into `NumberExtension`.

## [1.4.0]

- Use better lint rules. Add `File.size()` and more.

## [1.3.0]

- Fix DateTime isSameDay, add more String extensions and introduce File and Future extensions.

## [1.2.1]

- Fix EnumExtension to allow Iterable

## [1.2.0]

- Introduce `EnumExtension`.

## [1.1.0]

- Introduce `PlatformExtension`.

## [1.0.2]

- Add some comments and extra String methods.

## [1.0.1]

- Update readme.

## [1.0.0]

- Initial version.
