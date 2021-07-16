import 'package:flutter/material.dart';
import 'package:flutter_application_1/Grid/categories.dart';
import '../constans.dart';

class MyInkWell extends StatelessWidget {
  final Categories categories;

  final Function press;
  const MyInkWell({
    Key key,
    this.categories,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: press,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(kDefaultPaddin),
                decoration: BoxDecoration(
                  // color: categories.color,
                  gradient: categories.linearGradient,
                  borderRadius: BorderRadius.circular(16),
                ),
                /*  child: Hero(
                  tag: "${categories.name}", */
                child: Image.asset(
                  categories.image,
                  // fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
