import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Store/store.dart';
import 'package:flutter_application_1/constans.dart';
import 'package:flutter_application_1/model/product.dart';
import 'package:flutter_application_1/screens/welcome/component/roundedInputField.dart';

CollectionReference doce = FirebaseFirestore.instance.collection("products");
String pp, aa, num = '0';
bool exist;

class SellProduct extends StatefulWidget {
  const SellProduct({Key key}) : super(key: key);

  @override
  _SellProductState createState() => _SellProductState();
}

class _SellProductState extends State<SellProduct> {
  getpriceamount(String na, String nu, String ca, String val) async {
    pp = '0';
    CollectionReference col = FirebaseFirestore.instance.collection("products");
    await col
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser.uid)
        .where('Name', isEqualTo: na)
        .where('category', isEqualTo: ca)
        .where('validity', isEqualTo: val)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        pp = element.data()['price'];
        aa = element.data()['amount'];
        print(pp);
      });
    });
  }

  getamount(String na, String ca, String val) async {
    CollectionReference col = FirebaseFirestore.instance.collection("Sells");
    await col
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser.uid)
        .where('Name', isEqualTo: na)
        .where('category', isEqualTo: ca)
        .where('validity', isEqualTo: val)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        num = element.data()['amount'];
        print(num);
      });
    });
  }

  check(String na, String nu, String ca, String val) async {
    exist = false;
    CollectionReference col = FirebaseFirestore.instance.collection("products");
    final QuerySnapshot snapshot = await col
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser.uid)
        .where('Name', isEqualTo: na)
        .where('category', isEqualTo: ca)
        .where('validity', isEqualTo: val)
        .get();

    snapshot.docs.forEach((DocumentSnapshot doc) {
      if (doc.exists && int.parse(doc.data()['amount']) >= int.parse(nu)) {
        print("truuuuuuuuuuuuuuuuuuuuuuuuuue");
        exist = true;
      }
    });
  }

  sell_product(String na, String nu, String ca, String val) {
    CollectionReference sells = FirebaseFirestore.instance.collection("Sells");
    CollectionReference product =
        FirebaseFirestore.instance.collection("products");

    sells
        .doc(
            "$na" + "$val" + "$ca" + "${FirebaseAuth.instance.currentUser.uid}")
        .set({
      'Name': na,
      'amount': "${int.parse(num) + int.parse(nu)}",
      'category': ca,
      'price':
          "${double.parse(nu) * double.parse(pp) + int.parse(num) * double.parse(pp)}",
      'uid': FirebaseAuth.instance.currentUser.uid,
      'dateSell': DateTime.now().toString(),
      'validity': val,
    });

    if (aa == nu)
      product
          .doc("$na" +
              "$val" +
              "$ca" +
              "${FirebaseAuth.instance.currentUser.uid}")
          .delete();
    else
      product
          .doc("$na" +
              "$val" +
              "$ca" +
              "${FirebaseAuth.instance.currentUser.uid}")
          .update({'amount': "${int.parse(aa) - int.parse(nu)}"});
  }

  // static String id = 'AddProduct';
  final TextEditingController _one = new TextEditingController();
  final TextEditingController _two = new TextEditingController();
  final TextEditingController _three = new TextEditingController();
  String _name;
  String _amount;
  String _price;
  String _drop;
  String _validity;
  double cast1, cast2;
  Product product;

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
        title: Text("Sell Product"),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        backgroundColor: Orange,
        /*  bottom: PreferredSize(
          child: Container(),
          preferredSize: Size.fromHeight(70),
        ), */
      ),
      body: Form(
        key: _globalKey,
        /* child: Stack(
          children: [
            Positioned(
              left: 1,
              right: 1,
              top: 5,
              child: */
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                //  mainAxisAlignment: MainAxisAlignment.center,
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
                              prefixIcon: Icon(Icons.medical_services),
                              hintText: "product name",
                              border: InputBorder.none),
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
                            hintText: "Amount",
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
                          controller: _three,
                          decoration: InputDecoration(
                            hintText: "Validity",
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.timer_off),
                          ),
                          onChanged: (value) {
                            _validity = value;
                          })),
                  SizedBox(
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: Container(
                      padding: EdgeInsets.only(left: 15, right: 15),
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
                          setState(() {
                            _drop = value;
                            check(_name, _amount, _drop, _validity);
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
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green[300]),
                        onPressed: () async {
                          _one.clear();
                          _two.clear();
                          _three.clear();

                          await check(_name, _amount, _drop, _validity);
                          //   cast1 = double.parse(_price);
                          //  cast2 = double.parse(_amount);

                          /*   Timer(Duration(seconds: int.parse(_validity)), () {
                                print(
                                    "expired////////////////////////////////////////");
                              }); */

                          setState(() {
                            if (_globalKey.currentState.validate()) {
                              _globalKey.currentState.save();

                              if (exist == true) {
                                getpriceamount(
                                    _name, _amount, _drop, _validity);
                              } else
                                print("please enter an exist product");
                              ///////////////////////////////////
                            }
                          });
                        },
                        child: Text(
                          'Add to list',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                        onPressed: () async {
                          await getamount(_name, _drop, _validity);
                          setState(() {
                            if (exist == true)
                              sell_product(_name, _amount, _drop, _validity);
                          });
                        },
                        child: Text(
                          'Sell',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Row(
                              children: [
                                Text("data"),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("data"),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("data"),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("data"),
                              ],
                            ),
                          );
                        }),
                    color: Orange,
                    height: 300,
                  )
                ],
              ),
            ),
          ),
        ),
        //   ),
        //   ],
        //   ),
      ),
    );
  }
}

/* import 'package:flutter/material.dart';
import 'package:flutter_application_1/Store/store.dart';
import 'package:flutter_application_1/categories/conField.dart';
import 'package:flutter_application_1/constans.dart';
import 'package:flutter_application_1/model/product.dart';
import 'package:flutter_application_1/screens/welcome/component/RoundedBotton.dart';
import 'package:flutter_application_1/screens/welcome/component/roundedInputField.dart';
import 'package:flutter_application_1/screens/welcome/component/textFieldcon.dart';
import 'package:get/get.dart';

String _drop;
int i = 0;
var one;
var two;
double between;
String name1;
String num1;
String price1;
String _price;

class Sell extends StatefulWidget {
  const Sell({Key key}) : super(key: key);

  @override
  _SellState createState() => _SellState();
}

class _SellState extends State<Sell> {
  final TextEditingController _eCtrl1 = new TextEditingController();
  final TextEditingController _eCtrl2 = new TextEditingController();
  final TextEditingController _eCtrl = new TextEditingController();
  final _store = Store();

  final GlobalKey<FormState> _globalKey1 = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
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
      body: Form(
        key: _globalKey1,
        child: Stack(
          children: [
            Positioned(
                left: 1,
                right: 1,
                top: 20,
                child: Column(
                  children: [
                    /* Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                          color: Colors.orangeAccent.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(29)),
                      child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Product name"),
                          //   controller: _eCtrl,
                          onChanged: (value) {
                            name1 = value;
                          }),
                    ), */
                    RoundedInputField(
                      hintText: "product name",
                      onChanged: (value) {
                        name1 = value;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      child: Container(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        //width: 200,
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
                    RoundedInputField(
                      hintText: "amount",
                      onChanged: (value) {
                        num1 = value;
                      },
                    ),
                    /*  Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          width: size.width * 0.4,
                          decoration: BoxDecoration(
                              color: Colors.orangeAccent.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(29)),
                          child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none, hintText: "Amount"),
                              //  controller: _eCtrl1,
                              onChanged: (value) {
                                num1 = value;
                              }),
                        ), */
                    SizedBox(
                      width: 5,
                    ),
                    /*   Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding:
                                EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                            width: size.width * 0.4,
                            decoration: BoxDecoration(
                                color: Colors.orangeAccent.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(29)),
                            child: TextFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: ""),
                                controller: _eCtrl2,
                                onChanged: (value) {
                                  price1 = value;
                                }),
                          ), */

                    SizedBox(
                      width: 60,
                      height: 50,
                      child: ElevatedButton(
                          // shape: CircleBorder(),
                          //   color: Colors.orangeAccent,
                          onPressed: () {
                            /*             one = double.parse(num1);
                              two = double.parse(price1);
                              between = (one) * (two); */

                            setState(() {
                              if (_globalKey1.currentState.validate()) {
                                _globalKey1.currentState.save();
                                _store.sell_product(name1, num1, _drop);
                              }
                            });
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          )),
                    ),
                  ],
                )),
            Positioned(
              left: 1,
              right: 1,
              //  top: 400,
              top: 230,
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 350,
                      width: 300,
                      child: ListView(
                        children: [],
                      ),
                    ),

                    /*  DataTable(
                              columns: [
                                DataColumn(label: Text('Product')),
                                DataColumn(label: Text('Total')),
                                DataColumn(label: Text('Price')),
                                DataColumn(label: Text('Delete')),
                              ],
                              rows: listOfColumns
                                  .map(
                                    ((element) => DataRow(
                                          cells: <DataCell>[
                                            DataCell(Text(element["Name"])),
                                            DataCell(Text(element["Number"])),
                                            DataCell(Text(element["Price"])),
                                            DataCell(
                                              Text(element["Delete"]),
                                            )
                                          ],
                                        )),
                                  )
                                  .toList(),
                            ), */

                    /* Container(
                       
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPaddin),
                        width: 300,
                        height: 350,
                        color: Colors.greenAccent,
                        child: ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemCount: name.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "Product",
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.amber),
                                        ),
                                        Text(name[index])
                                      ],
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Number",
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.amber),
                                        ),
                                        Text(number[index].toString())
                                      ],
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Price",
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.amber),
                                        ),
                                        Text(price[index])
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ), */
                    SizedBox(
                      height: 30,
                    ),
                    RoundedButton(
                      color: Colors.redAccent,
                      text: "SELL",
                      press: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      /////////////////////////////////////////////////////
      /* 
                          child: Text(
                        '${name[index]} (${number[index]})',
                        style: TextStyle(fontSize: 18),
                 */
    );
  }
}
 */
