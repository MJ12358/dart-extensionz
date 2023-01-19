import 'package:dart_extensions/dart_extensions.dart';

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
