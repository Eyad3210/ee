import 'package:flutter/material.dart';

Widget field(width1, String hint, String variable) {
  Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: width1,
      decoration: BoxDecoration(
          color: Colors.orangeAccent.withOpacity(0.9),
          borderRadius: BorderRadius.circular(29)),
      child: TextField(
          decoration: InputDecoration(hintText: hint, border: InputBorder.none),
          onChanged: (value) {
            variable = value;
          }));
}
