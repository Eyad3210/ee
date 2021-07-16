import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Store/store.dart';
import 'package:flutter_application_1/categories/getCategs.dart';
import 'package:flutter_application_1/constans.dart';
import 'package:flutter_application_1/model/product.dart';
import 'package:flutter_application_1/screens/welcome/component/roundedInputField.dart';

CollectionReference doce = FirebaseFirestore.instance.collection("products");

class AddProduct extends StatefulWidget {
  const AddProduct({Key key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController _one = new TextEditingController();
  final TextEditingController _two = new TextEditingController();
  final TextEditingController _three = new TextEditingController();
  final TextEditingController _four = new TextEditingController();

  String _name;
  String _amount;
  String _price;
  String _drop;
  String _validity;
  double cast1, cast2;
  Product product;

  String x = "5";
  double y = 60;

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final _store = Store();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Products"),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        backgroundColor: Orange,
        /* bottom: PreferredSize(
          child: Container(),
          preferredSize: Size.fromHeight(70),
        ), */
      ),
      body: Form(
        key: _globalKey,
        child: Stack(
          children: [
            Positioned(
              left: 1,
              right: 1,
              top: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(29),
                          border: Border.all(color: Colors.orange, width: 2)),
                      child: TextField(
                          controller: _one,
                          decoration: InputDecoration(
                            hintText: "product name",
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.medical_services),
                          ),
                          onChanged: (value) {
                            _name = value;
                          })),
                  SizedBox(
                    height: 2,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(29),
                          border: Border.all(color: Colors.orange, width: 2)),
                      child: TextField(
                          controller: _two,
                          decoration: InputDecoration(
                            /* helperText:
                                "If the product exists, the old price won't change.", */
                            hintText: "price",
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.money),
                          ),
                          onTap: () {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.INFO_REVERSED,
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2),
                              width: 280,
                              buttonsBorderRadius:
                                  BorderRadius.all(Radius.circular(2)),
                              headerAnimationLoop: true,
                              animType: AnimType.BOTTOMSLIDE,
                              title:
                                  "If the product exists, the old price won't change.",
                              //desc: 'Dialog description here...',
                              showCloseIcon: true,
                              //  btnCancelOnPress: () {},
                              btnOkOnPress: () {},
                            )..show();
                          },
                          onChanged: (value) {
                            _price = value;
                          })),
                  SizedBox(
                    height: 2,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(29),
                          border: Border.all(color: Colors.orange, width: 2)),
                      child: TextField(
                          controller: _three,
                          decoration: InputDecoration(
                            hintText: "amount",
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.filter_9_plus),
                          ),
                          onChanged: (value) {
                            _amount = value;
                          })),
                  SizedBox(
                    height: 2,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(29),
                          border: Border.all(color: Colors.orange, width: 2)),
                      child: TextField(
                          controller: _four,
                          decoration: InputDecoration(
                            hintText: "validity",
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.timer_off),
                          ),
                          onChanged: (value) {
                            _validity = value;
                          })),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: Container(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      //width: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.orange, width: 2)),
                      child: DropdownButton(
                        hint: Text("Select category"),
                        icon: Icon(Icons.arrow_drop_down),
                        isExpanded: true,
                        underline: SizedBox(),
                        value: _drop,
                        dropdownColor: Colors.orange[100],
                        onChanged: (String value) {
                          //  _store.getData();
                          setState(() {
                            _drop = value;
                          });
                        },
                        items: [
                          DropdownMenuItem(
                            child: Text("pill"),
                            value: "pill",
                          ),
                          DropdownMenuItem(
                              child: Text("syringe"), value: "syringe"),
                          DropdownMenuItem(
                            child: Text("mask"),
                            value: "mask",
                          ),
                          DropdownMenuItem(
                            child: Text("drink"),
                            value: "drink",
                          ),
                          DropdownMenuItem(
                            child: Text("baby"),
                            value: "baby",
                          ),
                          DropdownMenuItem(
                            child: Text("others"),
                            value: "others",
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.green[300]),
                    onPressed: () {
                      _one.clear();
                      _two.clear();
                      _three.clear();
                      _three.clear();

                      //   cast1 = double.parse(_price);
                      //  cast2 = double.parse(_amount);

                      /*   Timer(Duration(seconds: int.parse(_validity)), () {
                        print(
                            "expired////////////////////////////////////////");
                      }); */

                      setState(() {
                        if (_globalKey.currentState.validate()) {
                          _globalKey.currentState.save();

                          _store.addProduct(
                            Product(
                              pName: _name,
                              pPrice: _price,
                              pAmount: _amount,
                              pCategory: _drop,
                              uid: FirebaseAuth.instance.currentUser.uid,
                              pdateBuy: DateTime.now().toString(),
                              pvalidity: _validity,
                            ),
                          );
                        }
                      });
                    },
                    child: Text('Add Product',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
