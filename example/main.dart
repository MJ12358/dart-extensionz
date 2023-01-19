import 'package:dart_extensionz/dart_extensionz.dart';

class MyClass {
  const MyClass({
    required this.name,
    required this.number,
  });

  final String name;
  final int number;

  String get initials => name.initials;

  String get ordinal => number.ordinal;
}
