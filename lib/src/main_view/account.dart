import 'dart:math';

class Account {
  Account(this.name, this.issuer, this.logoCodePoint, this.code);

  late final String name;
  final String issuer;
  final id = Random().toString();
  final int logoCodePoint;
  final String code;
}
