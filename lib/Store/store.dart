import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/model/product.dart';
import 'dart:async';

List<String> name = [];
List<String> listX = [];
List<String> listY = [];

List<String> list = [];
List<String> listp = [];
List<String> list1 = [];
List<String> listAM = [];
List<String> listCAT = [];
List<String> listuid = [];

String name1, price1;
int n = 0, n1 = 0;
String am, pa = '0';
String count;
int counter = 0;

class Store {
  ///////////////////////////////////////////////NEWWWWWW/////////////////////////////////
  getData() async {
    list.removeRange(0, list.length);
    listp.removeRange(0, listp.length);
    list1.removeRange(0, list1.length);
    listAM.removeRange(0, listAM.length);
    listCAT.removeRange(0, listCAT.length);
    listuid.removeRange(0, listuid.length);
    CollectionReference doc = FirebaseFirestore.instance.collection("products");
    await doc.get().then((value) {
      value.docs.forEach((element) {
        list.add(element.data()['Name']);
        listp.add(element.data()['price']);
        print(listp);
        list1.add(element.data()['validity']);
        listAM.add(element.data()['amount']);
        listCAT.add(element.data()['category']);
        listuid.add(element.data()['uid']);
      });
    });
  }

  addProduct(Product product) {
    ///////////////////////////////////*NEWWWWWWWWWWWWw*///////////////////////////////////
    CollectionReference doc1 =
        FirebaseFirestore.instance.collection("products");
    n = 0;
    n1 = 0;
    try {
      for (int i = 0; i < list.length; i++) {
        print(product.pName);
        if ((list[i] == product.pName) &&
            (listCAT[i] == product.pCategory) &&
            (listuid[i] == product.uid) &&
            (list1[i] != product.pvalidity)) {
          n1++;
          pa = listp[i];
        }
        if ((list[i] == product.pName) &&
            (list1[i] == product.pvalidity) &&
            (listCAT[i] == product.pCategory) &&
            (listuid[i] == product.uid)) {
          n++;
          am = listAM[i];
        }
      }
    } on Error catch (ex) {
      print(ex);
    }
    if (n == 0) {
      if (n1 == 0)
        doc1
            .doc("${product.pName}" +
                "${product.pvalidity}" +
                "${product.pCategory}" +
                "${product.uid}")
            .set({
          'Name': product.pName,
          'amount': product.pAmount,
          'category': product.pCategory,
          'price': product.pPrice,
          'uid': product.uid,
          'dateBuy': product.pdateBuy,
          'validity': product.pvalidity,
        });
      else
        doc1
            .doc("${product.pName}" +
                "${product.pvalidity}" +
                "${product.pCategory}" +
                "${product.uid}")
            .set({
          'Name': product.pName,
          'amount': product.pAmount,
          'category': product.pCategory,
          'price': pa,
          'uid': product.uid,
          'dateBuy': product.pdateBuy,
          'validity': product.pvalidity,
        });
    } else {
      doc1
          .doc("${product.pName}" +
              "${product.pvalidity}" +
              "${product.pCategory}" +
              "${product.uid}")
          .update({'amount': '${int.parse(am) + int.parse(product.pAmount)}'});
    }
  }

  /*getsell(String cate) async {
    listX.removeRange(0, listX.length);
    listY.removeRange(0, listY.length);
    CollectionReference get = FirebaseFirestore.instance.collection("products");
    await get
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser.uid)
        .where('category', isEqualTo: cate)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        name1 = element.data()['Name'];
        price1 = element.data()['price'];
        if (!listX.contains(name1)) {
          listX.add(name1);
          listY.add(price1);
        }

        print(listY);
      });
    });
  }*/

  /*addProduct1() async {
    CollectionReference sec = FirebaseFirestore.instance.collection("helper");

    print("PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP");
    try {
      for (int i = 0; i < listY.length; i++) {
        sec.get().then((value) {
          value.docs.forEach((element) {
            if (element.data()['Name'] == listX[i]) counter++;
          });
        });
        print(counter);
        if (counter == 0) {
          sec.add({
            'Name': listX[i],
            'price': listY[i],
          });
          counter = 0;
        }
      }
    } on Error catch (ex) {
      print(ex);
    }
  }
*/
}
