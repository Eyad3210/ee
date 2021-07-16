import 'package:flutter/material.dart';
import 'package:flutter_application_1/Grid/categories.dart';
import 'package:flutter_application_1/Grid/grid.dart';
import 'package:flutter_application_1/Store/store.dart';
import 'package:flutter_application_1/carosul/list.dart';
import 'package:flutter_application_1/categories/getCategs.dart';
import 'package:flutter_application_1/constans.dart';

final _store = Store();
var category = [
  Listt("pill"),
  Listt("syringe"),
  Listt("mask"),
  Listt("drink"),
  Listt("baby"),
  Listt("others"),
  /* categs(
    "pill",
  ),
  categs(
    "syringe",
  ),
  categs(
    "mask",
  ),
  categs(
    "drink",
  ),
  categs(
    "baby",
  ),
  categs(
    "others",
  ), */
];

class Expan extends StatelessWidget {
  const Expan({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: GridView.builder(
            itemCount: categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: kDefaultPaddin,
              crossAxisSpacing: kDefaultPaddin,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) => MyInkWell(
                categories: categories[index],
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => category[index]));
                })),
      ),
    );
  }
}
