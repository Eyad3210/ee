import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        Image.asset(
          "assest/images/logo.jpg",
          width: size.width * 0.5,
        ),
        SizedBox(width: size.width * 0.01),
        Text(
          "MyPharmacy",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 26, color: Colors.blue),
        )
      ],
    );
  }
}
