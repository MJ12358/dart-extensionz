extension StringExtension on String {
  bool toBool() {
    return ['y', 'yes', 'on', 'ok', 'true', 't', '1']
        .contains(trim().toLowerCase());
  }

  DateTime? toDateTime() {
    try {
      return DateTime.tryParse(this);
    } catch (_) {
      return null;
    }
  }

  String get initials {
    if (isBlank) {
      return 'NA';
    }
    final List<String> split = trim().split(RegExp(' +'));
    if (split.length >= 2) {
      return '${split[0].substring(0, 1)} ${split[1].substring(0, 1)}';
    }
    if (split[0].length >= 2) {
      return '${split[0].substring(0, 1)} ${split[0].substring(1, 2)}';
    }
    return split[0].substring(0, 1);
  }

  String get capitalize {
    if (isBlank) {
      return this;
    }
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  String get titleCase {
    if (isBlank) {
      return this;
    }
    final List<String> split = trim().split(RegExp(' +'));
    return split.map((String str) => str.capitalize).join(' ');
  }

  bool get isBlank {
    return trim().isEmpty;
  }

  List<String> splitByLength(int length) {
    return <String>[substring(0, length), substring(length)];
  }

  /// Convert this string to a Duration
  ///
  /// Can be used with an ISO formatted string
  /// or a Duration object that has been stringified
  Duration toDuration() {
    String isoRegex =
        r'^P((\d+Y)?(\d+M)?(\d+W)?(\d+D)?)(T(\d+H)?(\d+M)?(\d+S)?)?$';

    String dartRegex = r'^(\d+:)?(\d+:)?(\d+.)?(\d+)?$';

    if (RegExp(isoRegex).hasMatch(this)) {
      return _parseISODuration();
    } else if (RegExp(dartRegex).hasMatch(this)) {
      return _parseDartDuration();
    } else {
      return Duration.zero;
    }
  }

  /// Convert ISO duration string to a Dart Duration
  ///
  /// https://dart-review.googlesource.com/c/sdk/+/118566/1/sdk/lib/core/duration.dart#116
  ///
  Duration _parseISODuration() {
    final int years = _parseTime('Y');
    // final int months = _parseTime('M');
    final int weeks = _parseTime('W');
    final int days = _parseTime('D');
    final int hours = _parseTime('H');
    final int minutes = _parseTime('M');
    final int seconds = _parseTime('S');

    return Duration(
      days: days + (weeks * 7) + (years * 365),
      hours: hours,
      minutes: minutes,
      seconds: seconds,
    );
  }

  int _parseTime(String timeUnit) {
    final RegExpMatch? timeMatch = RegExp('(\\d+)$timeUnit').firstMatch(this);
    if (timeMatch == null) {
      return 0;
    }
    return int.parse(timeMatch.group(1) ?? '0');
  }

  /// Convert a Dart duration string to a Dart Duration
  ///
  /// https://github.com/desktop-dart/duration/blob/master/lib/src/parse/parse.dart
  Duration _parseDartDuration() {
    final List<String> parts = split(':');

    if (parts.length != 3) {
      throw FormatException('Invalid duration format');
    }

    int days;
    int hours;
    int minutes;
    int seconds;
    int milliseconds;
    int microseconds;

    {
      final p = parts[2].split('.');

      if (p.length != 2) {
        throw FormatException('Invalid time format');
      }

      // If fractional seconds is passed, but less than 6 digits
      // Pad out to the right so we can calculate the ms/us correctly
      final p2 = int.parse(p[1].padRight(6, '0'));
      microseconds = p2 % 1000;
      milliseconds = p2 ~/ 1000;

      seconds = int.parse(p[0]);
    }

    minutes = int.parse(parts[1]);

    {
      int p = int.parse(parts[0]);
      hours = p % 24;
      days = p ~/ 24;
    }

    // TODO verify that there are no negative parts

    return Duration(
        days: days,
        hours: hours,
        minutes: minutes,
        seconds: seconds,
        milliseconds: milliseconds,
        microseconds: microseconds);
  }
}
