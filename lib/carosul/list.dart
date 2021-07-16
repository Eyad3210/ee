import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/categories/details.dart';
import 'package:flutter_application_1/constans.dart';
import 'package:flutter_application_1/firstScreen/search.dart';
import 'package:get/get.dart';

class Listt extends StatefulWidget {
  String category;
  Listt(this.category);
  @override
  _ListtState createState() => _ListtState();
}

class _ListtState extends State<Listt> {
  List<String> namelist = [];
  List<String> pricelist = [];

  get() async {
    CollectionReference col = FirebaseFirestore.instance.collection("products");

    var e = await col
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser.uid)
        .where('category', isEqualTo: widget.category)
        .get();

    e.docs.forEach((element) {
      setState(() {
        if (!(namelist.contains(element.data()['Name']))) {
          namelist.add(element.data()['Name']);
          pricelist.add(element.data()['price']);
        }
      });
    });
    print(pricelist);
  }

  @override
  void initState() {
    //Timer(Duration(seconds: 3), () {});
    get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
        centerTitle: true,
        backgroundColor: Orange,
      ),
      body:

          /*    Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Search(),
            ), */
          Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: GridView.builder(
          itemCount: namelist.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1),
          itemBuilder: (context, index) {
            return Container(
              child: GestureDetector(
                onTap: () async {
                  await Get.to(Details(namelist[index], widget.category));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(kDefaultPaddin),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.purple, Colors.white]),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Hero(
                          tag: "",
                          child: Image.asset("assest/grid/drugs.png"
                              // fit: BoxFit.cover,

                              ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: kDefaultPaddin / 4),
                      child: Text(
                        "${namelist[index]}",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),

                    Text(
                      "\$${pricelist[index]}",
                      style: TextStyle(color: Colors.black),
                    ),

                    //  style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
