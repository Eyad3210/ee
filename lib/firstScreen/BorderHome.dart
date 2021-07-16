import 'package:flutter/material.dart';
import 'package:flutter_application_1/firstScreen/search.dart';

class BorderHome extends StatelessWidget {
  const BorderHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      // child: Icon(Icons.notifications),
      //child: Search(),
      height: size.height / 5.1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(90.0),
            bottomRight: Radius.circular(90.0),
          ),
          gradient: LinearGradient(colors: [
            Colors.orangeAccent,
            Colors.orangeAccent,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
    );
  }
}
