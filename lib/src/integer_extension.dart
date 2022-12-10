extension IntegerExtension on int {
  Duration toMicroseconds() {
    return Duration(microseconds: this);
  }

  Duration toMilliseconds() {
    return Duration(milliseconds: this);
  }

  Duration toSeconds() {
    return Duration(seconds: this);
  }

  Duration toMinutes() {
    return Duration(minutes: this);
  }

  Duration toHours() {
    return Duration(hours: this);
  }

  Duration toDays() {
    return Duration(days: this);
  }

  String get ordinal {
    if (this == 11 || this == 12 || this == 13) {
      return '${this}th';
    }
    if (this % 10 == 1) {
      return '${this}st';
    }
    if (this % 10 == 2) {
      return '${this}nd';
    }
    if (this % 10 == 3) {
      return '${this}rd';
    }
    return '${this}th';
  }
}
