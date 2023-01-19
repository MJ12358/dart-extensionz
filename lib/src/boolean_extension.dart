extension BooleanExtension on bool {
  int toInt() {
    return this ? 1 : 0;
  }

  String toYesNo() {
    return this ? 'Yes' : 'No';
  }
}
