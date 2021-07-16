import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Settings/set.dart';
import 'package:flutter_application_1/Store/store.dart';
import 'package:flutter_application_1/firstScreen/Sellings.dart';
import 'package:flutter_application_1/firstScreen/navHome.dart';
import 'package:flutter_application_1/model/product.dart';
import 'package:flutter_application_1/orders/orderBUY.dart';
import 'package:flutter_application_1/orders/orderSELL.dart';
import 'package:flutter_application_1/screens/Login/LoginScreen.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key key}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int Selectindex = 0;
  final List<Widget> lists = [
    Myhome(),
    AddProduct(),
    SellProduct(),
    Sellings(),
    Settingss(),
  ];
  getUser() {
    var user = FirebaseAuth.instance.currentUser;
    print(user.email);
  }

  @override
  void initState() {
    getUser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        color: Color(0xff40E0D0),
        //color: Colors.orangeAccent,
        backgroundColor: Colors.white,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
          Icon(Icons.list, size: 30, color: Colors.white),
          Icon(Icons.date_range, size: 30, color: Colors.white),
          Icon(Icons.settings, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            Selectindex = index;
          });
        },
        animationCurve: Curves.linear,
        animationDuration: const Duration(milliseconds: 300),
      ),
      body: lists[Selectindex],
    );
  }
}
