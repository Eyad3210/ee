import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/carosul/list.dart';
import 'package:flutter_application_1/carosul/testat.dart';

import 'package:flutter_application_1/constans.dart';
import 'package:flutter_application_1/firstScreen/navBar.dart';

import 'package:flutter_application_1/screens/onboarding.dart';
import 'package:get/get.dart';

import 'package:get/get_navigation/src/root/get_material_app.dart';

bool islogin;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var user = FirebaseAuth.instance.currentUser;
  if (user == null)
    islogin = false;
  else
    islogin = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        routes: {
          // Details.id: (context) => Details(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: primcolor, scaffoldBackgroundColor: Colors.white),
        home: //Listt());
            //Eyad());
            //Sell());
            // Navbar());
            islogin == false ? Onboarding() : Navbar());
    // Myhome());
  }
}
