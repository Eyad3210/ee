import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class test extends StatefulWidget {
  const test({Key key}) : super(key: key);

  @override
  _testState createState() => _testState();
}

class _testState extends State<test> {
  adduser() async {
    CollectionReference admin = FirebaseFirestore.instance.collection("Admins");
    admin.doc("3424253").set({"username": "jawad"});
  }

  @override
  void initState() {
    adduser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
