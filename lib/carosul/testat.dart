/* import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Eyad {
  sign() async {
    FirebaseFirestore.instance
        .collection('Sells')
        .doc('p2022pillNIrmO9DKy0cBu44jGWxyMo7BXpu2')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');

        print("doneeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
      } else {
        print('Document does not exist on the database');
      }
    });
  }
} */
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

List<String> namelist = [];
List<String> pricelist = [];

class Storing extends GetxController {
  get() async {
    CollectionReference col = FirebaseFirestore.instance.collection("products");

    var e = await col
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser.uid)
        .where('category', isEqualTo: "")
        .get();

    e.docs.forEach((element) {
      //
      if (!(namelist.contains(element.data()['Name']))) {
        namelist.add(element.data()['Name']);
        pricelist.add(element.data()['price']);
      }
      update();

      //
    });
    print(pricelist);
  }
}
