import 'package:flutter/material.dart';

class Switch1 extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Switch1> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isSwitched,
      onChanged: (value) {
        setState(() {
          isSwitched = value;
          print(isSwitched);
        });
      },
      activeTrackColor: Colors.yellow,
      activeColor: Colors.orangeAccent,
    );
  }
}
