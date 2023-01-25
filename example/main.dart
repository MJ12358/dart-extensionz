import 'package:dart_extensionz/dart_extensionz.dart';

enum MyEnum {
  one,
  two,
  three,
}

class MyClass {
  const MyClass({
    required this.name,
    required this.number,
    required this.myEnum,
  });

  final String name;
  final int number;
  final MyEnum myEnum;

  String get initials => name.initials;

  String get ordinal => number.ordinal;

  String get myEnumLabel => myEnum.label;
}
