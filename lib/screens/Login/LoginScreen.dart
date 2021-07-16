import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/firstScreen/navBar.dart';
import 'package:flutter_application_1/screens/SignUp/Signup_screen.dart';
import 'package:flutter_application_1/screens/welcome/component/RoundedBotton.dart';
import 'package:flutter_application_1/screens/welcome/component/RoundedPass.dart';
import 'package:flutter_application_1/screens/welcome/component/TextHaveAccount.dart';
import 'package:flutter_application_1/screens/welcome/component/conborder.dart';
import 'package:flutter_application_1/screens/welcome/component/roundedInputField.dart';
import 'package:get/get.dart';

class LoginScreen1 extends StatelessWidget {
  var mypassword, myemail;
  signin() async {
    var formdata = formstate.currentState;
    if (formdata.validate()) {
      formdata.save();

      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: myemail, password: mypassword);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    } else
      print("erooorrrrr");
  }

  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, Colors.white]),
        ),
        width: double.infinity,
        height: size.height,
        child: Form(
          key: formstate,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  top: 1, bottom: 400, left: 1, right: 1, child: Conborder()),
              Positioned(
                  bottom: 80,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        //new1
                        Image.asset("assest/images/on3.png",
                            width: size.width * 1.1),
                        SizedBox(height: size.height * 0.18),
                        RoundedInputField(
                          icon: Icons.person,
                          hintText: "Email",
                          onChanged: (value) {
                            myemail = value;
                          },
                        ),
                        RondedPasswordField(
                          onChanged: (value) {
                            mypassword = value;
                          },
                        ),
                        RoundedButton(
                          color: Colors.lightBlue[600],
                          text: "تسجيل الدخول",
                          press: () async {
                            var user = await signin();
                            if (user != null) {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) {
                                return Navbar();
                              }));
                            }
                          },
                        ),
                        TextHaveAccount(
                          press: () {
                            /*   Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return SignupScreen();
                                  },
                                ),
                              ); */
                            Get.to(SignupScreen());
                          },
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
