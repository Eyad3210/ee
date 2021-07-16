import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      // height: 10,
      width: size.width / 1.2,
      margin: EdgeInsets.symmetric(vertical: 15),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(29.5),
          border: Border.all(color: Colors.orange, width: 3)),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search",
          icon: Icon(Icons.search),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
