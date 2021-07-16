import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String pName;
  String pPrice;
  String pAmount;
  String pCategory;
  String pid;
  String uid;
  String pdateBuy;
  String pvalidity;

  Product(
      {this.uid,
      this.pid,
      this.pName,
      this.pCategory,
      this.pAmount,
      this.pPrice,
      this.pdateBuy,
      this.pvalidity});
}
