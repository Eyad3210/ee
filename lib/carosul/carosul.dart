import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class Carosul extends StatefulWidget {
  const Carosul({Key key}) : super(key: key);

  @override
  _CarosulState createState() => _CarosulState();
}

class _CarosulState extends State<Carosul> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
      height: 240,
      width: double.infinity,
      child: Carousel(
        boxFit: BoxFit.cover,
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 2.0,
        dotIncreasedColor: Colors.orange,
        dotBgColor: Colors.transparent,
        dotPosition: DotPosition.bottomCenter,
        dotVerticalPadding: 10.0,
        showIndicator: true,
        borderRadius: true,
        indicatorBgPadding: 7.0,
        images: [
          /* Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
            child: Image.asset("assest/images/corona.jpg"),
          ) */
          AssetImage("assest/images/corona.jpg"),

          AssetImage("assest/images/corona2.jfif"),
          AssetImage("assest/images/corona3.jfif"),
          AssetImage("assest/images/corona4.jpg"),
          AssetImage("assest/images/corona5.jfif"),

          //// خصائص ال نقط
        ],
        dotIncreaseSize: 2,
        dotSpacing: 10,
        dotColor: Colors.black,
      ),
    );
  }
}
