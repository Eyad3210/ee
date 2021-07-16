import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/SignUp/Signup_screen.dart';
import 'package:flutter_application_1/screens/welcome/component/backround.dart';

class Conborder extends StatelessWidget {
  final double hight;
  const Conborder({Key key, this.hight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: hight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(55.0),
            bottomRight: Radius.circular(55.0),
          ),
          gradient: LinearGradient(colors: [
            Colors.orange.withOpacity(0.3),
            Colors.orange.withOpacity(0.7),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
    );
  }
}
