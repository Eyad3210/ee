import 'package:flutter/material.dart';

class Categories {
  final String image, name;
  final Color color;
  final LinearGradient linearGradient;

  Categories({this.linearGradient, this.name, this.image, this.color});
}

List<Categories> categories = [
  Categories(
    image: "assest/grid/drugs.png",
    linearGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.purple, Colors.white]),
  ),
  Categories(
      image: "assest/grid/syringe.png",
      linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.lightBlue, Colors.white])),
  Categories(
      image: "assest/grid/mask.png",
      linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.red, Colors.white])),
  Categories(
      image: "assest/grid/soul2.png",
      linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.deepPurple[700], Colors.white])),
  Categories(
      image: "assest/grid/aid.png",
      linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.orange, Colors.white])),
  Categories(
      image: "assest/grid/make.png",
      linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.green, Colors.white])),

  /* Categories(
      image: "assest/grid/cream.png",
      // color: Colors.yellowAccent[100]
      linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.green, Colors.white])),
  Categories(
      image: "assest/grid/paste.png",
      //  color: Colors.yellowAccent[100]
      linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue, Colors.white])),
  Categories(
      image: "assest/grid/list.png",
      name: "kareemss",
      color: Colors.yellowAccent[100]) */
];
