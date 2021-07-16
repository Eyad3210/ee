import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_application_1/firstScreen/navBar.dart';
import 'package:flutter_application_1/screens/Login/LoginScreen.dart';
import 'package:flutter_application_1/screens/welcome/component/RoundedBotton.dart';
import 'package:flutter_application_1/screens/welcome/component/RoundedPass.dart';
import 'package:flutter_application_1/screens/welcome/component/TextHaveAccount.dart';
import 'package:flutter_application_1/screens/welcome/component/conborder.dart';
import 'package:flutter_application_1/screens/welcome/component/or-divider.dart';
import 'package:flutter_application_1/screens/welcome/component/roundedInputField.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  //validator : (val){if val.length >100 and <2 return " error"}

  var mypassword, myemail;
  // ignore: non_constant_identifier_names
  String Myusername;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  signup() async {
    var formdata = formstate.currentState;
    if (formdata.validate()) {
      formdata.save();
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: myemail,
          password: mypassword,
        );
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    } else {}
  }

  adduser() async {
    CollectionReference user = FirebaseFirestore.instance.collection("users");
    user.add({
      'username': "$Myusername",
      'email': "$myemail",
      'uid': FirebaseAuth.instance.currentUser.uid
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Colors.white.withOpacity(0.8),
              Colors.white.withOpacity(0.1)
            ])),
        width: double.infinity,
        height: size.height,
        child: Form(
          key: formstate,
          child: Stack(alignment: Alignment.center, children: [
            Positioned(
                top: 1, bottom: 400, left: 1, right: 1, child: Conborder()),
            Positioned(
                bottom: 30,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(
                        //new2
                        "assest/images/on3.png",
                        width: size.width * 1.1,
                      ),
                      SizedBox(
                        height: size.height * 0.15,
                      ),
                      RoundedInputField(
                        icon: Icons.person,
                        hintText: "username",
                        onChanged: (value) {
                          Myusername = value;
                        },
                      ),
                      RoundedInputField(
                        icon: Icons.email,
                        hintText: "Email",
                        onChanged: (value) {
                          myemail = value;
                          print(myemail);
                        },
                      ),
                      RondedPasswordField(
                        onChanged: (value) {
                          mypassword = value;
                        },
                      ),
                      RoundedButton(
                        color: Colors.lightBlue[600],
                        text: "Signup",
                        press: () async {
                          UserCredential response = await signup();

                          if (response != null) {
                            await adduser();
                            Get.to(Navbar());
                          } else {
                            print("Faild");
                          }
                        },
                      ),
                      TextHaveAccount(
                        login: false,
                        press: () {
                          Get.off(LoginScreen1());
                        },
                      ),
                      // OrDivider(),
                    ],
                  ),
                ))
          ]),
        ),
      ),
    );
  }
}
