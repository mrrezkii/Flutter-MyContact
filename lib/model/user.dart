import 'dart:core';

class User {
  String name;
  String number;
  String? address;
  bool priority;

  User(
      {required this.name,
      required this.number,
      this.address,
      this.priority = false});
}
