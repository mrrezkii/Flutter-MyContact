import 'dart:core';

import 'package:my_contact/shared/photo.dart';

class User {
  static const emptyPhoto =
      "https://cdn.pixabay.com/photo/2018/03/23/22/11/question-mark-3255140_960_720.jpg";

  String? id;
  String? name;
  String? number;
  String? address;
  bool? priority;
  String? photo;

  User(
      {this.id,
      this.name,
      this.number,
      this.address,
      this.priority = false,
      this.photo = emptyPhoto});
}

List<User> mockUser = [
  User(
      id: '0',
      name: "Nyonya Nouman",
      number: "+6283192753645",
      address: "Magetan, Jawa Timur",
      priority: true,
      photo: Photo.randomPhoto()),
  User(
      id: '1',
      name: "Angela",
      number: "+19092952562",
      address: "Kediri, Jawa Timur",
      priority: true,
      photo: Photo.randomPhoto()),
  User(
      id: '2',
      name: "Bunda Kidul",
      number: "+13046022178",
      address: "Bandung, Jawa Barat",
      priority: false,
      photo: Photo.randomPhoto()),
  User(
      id: '3',
      name: "Kepsek TK",
      number: "+6283192753645",
      address: "Yogyakarta, DIY Yogyakarta",
      priority: false,
      photo: Photo.randomPhoto()),
  User(
      id: '4',
      name: "Adik Telkomsel",
      number: "+16627368356",
      address: "Jakarta Selatan, DKI Jakarta",
      priority: true,
      photo: Photo.randomPhoto()),
  User(
      id: '5',
      name: "Pacar 2",
      number: "+13159082136",
      address: "Konohagakure",
      priority: true,
      photo: Photo.randomPhoto()),
  User(
      id: '6',
      name: "Mantan camer",
      number: "+17326559967",
      address: "Sunagakure",
      priority: false,
      photo: Photo.randomPhoto()),
  User(
      id: '7',
      name: "Badut",
      number: "+12342220942",
      address: "Amegakure",
      priority: true,
      photo: Photo.randomPhoto()),
  User(
      id: '8',
      name: "Temen Gabut",
      number: "+17815610209",
      address: "Iwagakure",
      priority: false,
      photo: Photo.randomPhoto()),
];
