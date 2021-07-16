import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Store/store.dart';
import 'package:flutter_application_1/carosul/list.dart';
import 'package:flutter_application_1/categories/innerGRID.dart';
import 'package:flutter_application_1/constans.dart';
import 'package:flutter_application_1/firstScreen/expanded.dart';
import 'package:flutter_application_1/model/product.dart';

List<String> innervalid = [];
List<String> innercount = [];
List<String> innerprice = [];

class Details extends StatefulWidget {
  String nname, cat;
  Details(this.nname, this.cat);
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  getinner(String cat, String n1) async {
    CollectionReference col = FirebaseFirestore.instance.collection("products");
    innercount.removeRange(0, innercount.length);
    innervalid.removeRange(0, innervalid.length);
    innerprice.removeRange(0, innerprice.length);
    var e = await col
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser.uid)
        .where('category', isEqualTo: cat)
        .where('Name', isEqualTo: n1)
        .get();

    e.docs.forEach((element) {
      setState(() {
        innercount.add(element.data()['amount']);
        innervalid.add(element.data()['validity']);
        innerprice.add(element.data()['price']);
      });
    });
    print(innercount);
  }

  deletedoc() {
    CollectionReference col = FirebaseFirestore.instance.collection("products");
    col.snapshots().forEach((element) {
      for (QueryDocumentSnapshot snapshot in element.docs) {
        snapshot.reference.delete();
      }
    });
  }
  /*getinner() async {
    CollectionReference col = FirebaseFirestore.instance.collection("products");

    var e = await col
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser.uid)
        .where('category', isEqualTo: widget.cat)
        .where('Name', isEqualTo: widget.nname)
        .get();

    e.docs.forEach((element) {
      setState(() {
        innercount.add(element.data()['amount']);
        innervlid.add(element.data()['validity']);
      });
    });
    print(innercount);
  }*/

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    String names = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          backgroundColor: Orange,
          title: Text("${widget.nname}"),
          centerTitle: true,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      //   cast1 = double.parse(_price);
                      //  cast2 = double.parse(_amount);

                      /*   Timer(Duration(seconds: int.parse(_validity)), () {
                          print(
                              "expired////////////////////////////////////////");
                        }); */

                      setState(() {
                        getinner(widget.cat, widget.nname);
                      });
                    },
                    child: Text("Show details",
                        style: TextStyle(color: Colors.black)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () async {
                      await deletedoc(); //   cast1 = double.parse(_price);
                      //  cast2 = double.parse(_amount);

                      /*   Timer(Duration(seconds: int.parse(_validity)), () {
                          print(
                              "expired////////////////////////////////////////");
                        }); */

                      setState(() {});
                    },
                    child: Text("Delete all documents",
                        style: TextStyle(color: Colors.black)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Edit Price",
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              ),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPaddin),
        // padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: ListView.builder(
            itemCount: innercount.length,
            /*  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: kDefaultPaddin,
              crossAxisSpacing: kDefaultPaddin,
              childAspectRatio: 1,
            ), */
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  width: size.width,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(50)),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.primaries[
                              Random().nextInt(Colors.primaries.length)],
                          Colors.grey[350]
                        ]),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Quantity :",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "${innercount[index]}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text("Validity :",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "${innervalid[index]}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text("Price :",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "\$${innerprice[index]}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],

                        // "\n~ ${innercount[index]} pice valid until ${innervalid[index]} , price : ${innerprice[index]}",
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Image.asset('assest/grid/drugs.png',
                          width: size.width * 0.3),
                    ],
                  ),
                ),
              );
            }),
      ),

      /* Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Container(
          child: ListView.builder(
            itemCount: innercount.length,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  children: [
                    Expan2(),
                    Column(
                      children: [
                        Text(
                          "\n~ ${innercount[index]} pice valid until ${innervalid[index]} , price : ${innerprice[index]}",
                          style: TextStyle(color: Colors.blue[200]),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ), */
    );
  }
}
