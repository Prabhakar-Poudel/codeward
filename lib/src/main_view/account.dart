import 'dart:math';

class Account {
  Account(this.name, this.issuer, this.code);

  late final String name;
  final String issuer;
  final id = Random().toString();
  final String code;
}
