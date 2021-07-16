import 'dart:async';
import 'package:flutter_application_1/categories/conField.dart';
import 'package:flutter_application_1/constans.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Store/store.dart';
import 'package:flutter_application_1/model/product.dart';
import 'package:flutter_application_1/screens/welcome/component/roundedInputField.dart';

class Sellings extends StatefulWidget {
  const Sellings({Key key}) : super(key: key);

  @override
  _SellingsState createState() => _SellingsState();
}

class _SellingsState extends State<Sellings> {
  String _day1, _month1, _year1;
  String month2, year2;
  getdayinventory(String day, String month, String year) async {
    String mytime = '${year}-${month}-${day}';
    String time;
    DateTime mydate = DateTime.parse(mytime);
    CollectionReference sells = FirebaseFirestore.instance.collection("Sells");
    await sells
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        time = element.data()['dateSell'];
        DateTime date = DateTime.parse(time);
        if ((DateFormat('yyyy-MM-dd').format(date)) ==
            (DateFormat('yyyy-MM-dd').format(mydate))) {
          print(
              "${element.data()['Name']} : ${element.data()['amount']} = ${element.data()['price']}");
        }
      });
    });
  }

  getmonthinventory(String month, String year) async {
    String mydate = '${year}-${month}';
    String date;

    CollectionReference sells = FirebaseFirestore.instance.collection("Sells");
    await sells
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        date = element.data()['dateSell'];
        if (date.contains(mydate)) {
          print(
              "${element.data()['Name']} : ${element.data()['amount']} = ${element.data()['price']}");
        }
      });
    });
  }

  final TextEditingController _one = new TextEditingController();
  final TextEditingController _two = new TextEditingController();
  final TextEditingController _three = new TextEditingController();

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  bool x;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        title: Text(
          "Invoices",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Orange,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Text(
                      "Daily",
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      x = false;
                    });
                  },
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Text(
                      "Monthly",
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      x = true;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: Form(
        key: _globalKey,
        child: Container(
          alignment: Alignment.center,
          child: Stack(
            children: [
              Positioned(
                left: 1,
                right: 1,
                top: 30,
                child: x == false
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(29),
                                  border: Border.all(
                                      color: Colors.orange, width: 2)),
                              child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "day",
                                    border: InputBorder.none,
                                    prefixIcon: Icon(Icons.calendar_view_day),
                                  ),
                                  onChanged: (value) {
                                    _day1 = value;
                                  })),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  width: size.width * 0.4,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.9),
                                      borderRadius: BorderRadius.circular(29),
                                      border: Border.all(
                                          color: Colors.orange, width: 2)),
                                  child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "month",
                                        border: InputBorder.none,
                                        prefixIcon: Icon(Icons.twelve_mp),
                                      ),
                                      onChanged: (value) {
                                        _month1 = value;
                                      })),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  width: size.width * 0.4,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.9),
                                      borderRadius: BorderRadius.circular(29),
                                      border: Border.all(
                                          color: Colors.orange, width: 2)),
                                  child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "year",
                                        border: InputBorder.none,
                                        prefixIcon: Icon(Icons.calendar_today),
                                      ),
                                      onChanged: (value) {
                                        _year1 = value;
                                      })),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.green[300]),
                            onPressed: () {
                              setState(() {
                                if (_globalKey.currentState.validate()) {
                                  _globalKey.currentState.save();

                                  getdayinventory(_day1, _month1, _year1);
                                }
                              });
                            },
                            child: Text(
                              'Daily inventory',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 100,
                            color: Colors.blue,
                            child: ListView.builder(
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return Container(
                                    child: Row(
                                      children: [],
                                    ),
                                  );
                                }),
                          )
                        ],
                      )
                    ///////////////////////////////////////////////
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  width: size.width * 0.4,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.9),
                                      borderRadius: BorderRadius.circular(29),
                                      border: Border.all(
                                          color: Colors.orange, width: 2)),
                                  child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "month",
                                        border: InputBorder.none,
                                        prefixIcon: Icon(Icons.twelve_mp),
                                      ),
                                      onChanged: (value) {
                                        _year1 = value;
                                      })),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  width: size.width * 0.4,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.9),
                                      borderRadius: BorderRadius.circular(29),
                                      border: Border.all(
                                          color: Colors.orange, width: 2)),
                                  child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "year",
                                        border: InputBorder.none,
                                        prefixIcon: Icon(Icons.calendar_today),
                                      ),
                                      onChanged: (value) {
                                        _year1 = value;
                                      })),
                            ],
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.green[300]),
                            onPressed: () {
                              setState(() {
                                if (_globalKey.currentState.validate()) {
                                  _globalKey.currentState.save();

                                  getmonthinventory(month2, year2);
                                }
                              });
                            },
                            child: Text(
                              'Month inventory',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            height: 100,
                            color: Colors.blue,
                            child: ListView.builder(
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return Container(
                                    child: Row(
                                      children: [],
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
