extension StringExtension on String {
  bool toBool() {
    return ['y', 'yes', 'on', 'ok', 'true', 't', '1']
        .contains(trim().toLowerCase());
  }

  String get initials {
    if (isBlank) {
      return 'NA';
    }
    final List<String> split = trim().split(RegExp(' +'));
    if (split.length >= 2) {
      return '${split[0].substring(0, 1)} ${split[1].substring(0, 1)}';
    }
    return '${split[0].substring(0, 1)} ${split[0].substring(1, 2)}';
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

  /// https://dart-review.googlesource.com/c/sdk/+/118566/1/sdk/lib/core/duration.dart#116
  Duration toDuration() {
    if (!RegExp(r'^P((\d+W)?(\d+D)?)(T(\d+H)?(\d+M)?(\d+S)?)?$')
        .hasMatch(this)) {
      return Duration.zero;
    }

    final int weeks = _parseTime('W');
    final int days = _parseTime('D');
    final int hours = _parseTime('H');
    final int minutes = _parseTime('M');
    final int seconds = _parseTime('S');

    return Duration(
      days: days + (weeks * 7),
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
}
