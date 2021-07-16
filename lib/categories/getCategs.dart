import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Store/store.dart';
import 'package:flutter_application_1/categories/details.dart';
import 'package:flutter_application_1/constans.dart';
import 'package:get/get.dart';

CollectionReference product = FirebaseFirestore.instance.collection("products");
final _store = Store();

class listt extends StatefulWidget {
  String cat;

  listt(this.cat);

  @override
  _listtState createState() => _listtState();
}

class _listtState extends State<listt> {
  @override
  void initState() {
    //  _store.addProduct1();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.cat}"),
          centerTitle: true,
          backgroundColor: Orange,
        ),
        body: StreamBuilder(
          stream: product
              .where('category', isEqualTo: widget.cat)
              .where('uid', isEqualTo: FirebaseAuth.instance.currentUser.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                  child: Text(
                "error",
                style: TextStyle(color: Colors.black, fontSize: 30),
              ));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: CircularProgressIndicator(
                      strokeWidth: 4,
                    )),
                    Text(
                      "Please Wait Baby",
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    )
                  ],
                ),
              );
            }
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                child: GridView.builder(
                    itemCount: snapshot.data.docs.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: kDefaultPaddin,
                      crossAxisSpacing: kDefaultPaddin,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.pushNamed(context,Details.id,arguments: snapshot.data.docs[index] );
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
                                    // color: categories.color,
                                    // gradient: categories.linearGradient,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Hero(
                                    tag:
                                        "${snapshot.data.docs[index].data()['Name']}",
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
                                  "${snapshot.data.docs[index].data()['Name']}",
                                  style: TextStyle(color: Colors.purple),
                                ),
                              ),
                              Text(
                                  "\$${snapshot.data.docs[index].data()['price']}",
                                  style: TextStyle(fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      );
                    }),
              );

              /* ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      Text("${snapshot.data.docs[i].data()['name']}"),
                    ],
                  );
                }); */
            }
            return Center(child: Text("wait baby"));
          },
        ));
  }
}


/* Widget categs(String cat) {
  CollectionReference product =
      FirebaseFirestore.instance.collection("products");
  return 
} */
