import 'package:flutter/material.dart';

class TextFieldCON extends StatelessWidget {
  final Widget child;

  const TextFieldCON({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      // width:width,
      decoration: BoxDecoration(
        color: Colors.orangeAccent.withOpacity(0.9),
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
