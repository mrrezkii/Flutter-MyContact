import 'dart:core';

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
      photo:
          "https://gravatar.com/avatar/503f5a145a84199a8ce0e5e99390642f?s=400&d=robohash&r=x"),
  User(
      id: '1',
      name: "Angela",
      number: "+19092952562",
      address: "Kediri, Jawa Timur",
      priority: true,
      photo:
          "https://gravatar.com/avatar/352bb1a5556920886dc44699a37852c9?s=400&d=robohash&r=x"),
  User(
      id: '2',
      name: "Bunda Kidul",
      number: "+13046022178",
      address: "Bandung, Jawa Barat",
      priority: false,
      photo:
          "https://gravatar.com/avatar/1dd0e8bad1ec8c74046724bb52e1001f?s=400&d=robohash&r=x"),
  User(
      id: '3',
      name: "Kepsek TK",
      number: "+6283192753645",
      address: "Yogyakarta, DIY Yogyakarta",
      priority: false,
      photo:
          "https://gravatar.com/avatar/00433c122a65c45e7fff037b6d2a3c1f?s=400&d=robohash&r=x"),
  User(
      id: '4',
      name: "Adik Telkomsel",
      number: "+16627368356",
      address: "Jakarta Selatan, DKI Jakarta",
      priority: true,
      photo:
          "https://gravatar.com/avatar/67a8dd76ebae094a0520abc2dccbec5f?s=400&d=robohash&r=x"),
  User(
      id: '5',
      name: "Pacar 2",
      number: "+13159082136",
      address: "Konohagakure",
      priority: true,
      photo:
          "https://gravatar.com/avatar/4efe8bde3aead08f02bc67cc6b35ca5f?s=400&d=robohash&r=x"),
  User(
      id: '6',
      name: "Mantan camer",
      number: "+17326559967",
      address: "Sunagakure",
      priority: false,
      photo:
          "https://gravatar.com/avatar/8ea5248e2b36ae8b8931bf674eb74718?s=400&d=robohash&r=x"),
  User(
      id: '7',
      name: "Badut",
      number: "+12342220942",
      address: "Amegakure",
      priority: true,
      photo:
          "https://gravatar.com/avatar/d54f74799e2fa65b83ad94499e016fbc?s=400&d=robohash&r=x"),
  User(
      id: '8',
      name: "Temen Gabut",
      number: "+17815610209",
      address: "Iwagakure",
      priority: false,
      photo:
          "https://gravatar.com/avatar/96f92b4743849790457917d7f7d7e59d?s=400&d=robohash&r=x"),
];
