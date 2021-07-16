import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Login/LoginScreen.dart';
import 'package:flutter_application_1/screens/SignUp/Signup_screen.dart';
import 'package:flutter_application_1/screens/welcome/component/roundedInputField.dart';
import 'package:get/get.dart';

import 'RoundedBotton.dart';
import 'buildLogo.dart';

class Backround extends StatelessWidget {
  final Widget child;
  final Widget Myusername;
  const Backround({
    Key key,
    @required this.child,
    this.Myusername,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.orange, Colors.white])),
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Positioned(top: 50, left: 0, child:                       Conborder()),

          Positioned(
              bottom: 100,
              child: Column(
                children: [
                  // SizedBox(
                  // height: size.height * 0.03,
                  //), //log1
                  Image.asset("assest/images/on3.png", width: size.width * 1.2),
                  SizedBox(
                    height: size.height * 0.15,
                  ),
                  RoundedButton(
                    color: Colors.lightBlue[600],
                    text: "Sign In",
                    press: () {
                      /* Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen1();
                          },
                        ),
                      ); */
                      Get.to(LoginScreen1());
                    },
                  ),
                  RoundedButton(
                    color: Colors.lightBlue[600],
                    text: "Signup",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignupScreen();
                          },
                        ),
                      );
                      //   Get.to(SignupScreen());
                    },
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
