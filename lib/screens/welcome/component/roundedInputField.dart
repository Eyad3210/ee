import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/welcome/component/textFieldcon.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final Function validator;

  final Function onChanged;

  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon,
    this.onChanged,
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldCON(
      child: TextField(
        textAlign: TextAlign.left,
        onChanged: onChanged,
        decoration: InputDecoration(
            prefixIcon: Icon(icon),
            hintText: hintText,
            border: InputBorder.none),
      ),
    );
  }
}
