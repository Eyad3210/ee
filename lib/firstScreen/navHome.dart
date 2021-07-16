import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Store/store.dart';

import 'package:flutter_application_1/carosul/carosul2.dart';
import 'package:flutter_application_1/carosul/testat.dart';
import 'package:flutter_application_1/firstScreen/BorderHome.dart';
import 'package:flutter_application_1/firstScreen/expanded.dart';
import 'package:flutter_application_1/firstScreen/search.dart';

class Myhome extends StatefulWidget {
  const Myhome({Key key}) : super(key: key);

  @override
  _MyhomeState createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  //final _eyad = Eyad();

  @override
  void initState() {
    //_store.getsell("pill");
    // _eyad.sign();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orangeAccent,
        leading: InkWell(
          child: Icon(
            Icons.notifications,
            size: 30,
            color: Colors.white,
          ),
          onTap: () {},
        ),
      ),
      drawer: Drawer(),
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Positioned(top: 0, left: 1, right: 1, child: BorderHome()),
            Positioned(
              top: -30,
              bottom: 10,
              left: 1,
              right: 1,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text("Hello ",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Search(),
                  SizedBox(
                    height: 35,
                  ),
                  Carosul2(),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Categories",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expan(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/* StreamBuilder(
          stream: product.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("error");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Column(
                children: [
                  Container(child: CircularProgressIndicator()),
                  Text("Please Waiting Baby")
                ],
              );
            }
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, i) {
                    return Text("${snapshot.data.docs[i].data()['name']}");
                  });
            }
            return Text("wait baby");
          }, */
      //  ));