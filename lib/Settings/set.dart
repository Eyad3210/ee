import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Settings/switch.dart';
import 'package:flutter_application_1/constans.dart';
import 'package:flutter_application_1/firstScreen/BorderHome.dart';
import 'package:flutter_application_1/screens/Login/LoginScreen.dart';
import 'package:flutter_application_1/screens/welcome/component/RoundedBotton.dart';
import 'package:get/get.dart';

/*  */
class Settingss extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;
  // const Settings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSwitched = false;
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(100),
          //bottomRight: Radius.circular(),
        )),
        backgroundColor: Orange,
        bottom: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Container(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    FirebaseAuth.instance.currentUser.email,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage('assest/images/doctor.png'),
                  ),
                ],
              ),
            ),
          ),
          preferredSize: Size.fromHeight(100),
        ),
      ),
      body: Container(
        // child: Stack(
        //  alignment: Alignment.center,
        // children: [
        //  Positioned(top: 0, left: 1, right: 1, child: BorderHome()),
        /* Positioned(
              top: 70,
              bottom: 50,
              left: 1,
              right: 1, */
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            /*    Text(
                    "DR eyad",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ), */

            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.info,
                  color: Colors.green,
                  size: 30,
                ),
                SizedBox(
                  width: 20,
                ),
                RoundedButton(
                    color: Colors.orangeAccent,
                    press: () {},
                    text: "DR EYAD BUSTANI"),
              ],
            ),
            // Switch1(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.notifications,
                  color: Colors.green,
                  size: 30,
                ),
                SizedBox(
                  width: 20,
                ),
                RoundedButton(
                    color: Colors.orangeAccent,
                    press: () {},
                    text: "Notifications"),
                SizedBox(
                  width: 5,
                ),
                //   Switch1()
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.contact_mail,
                  color: Colors.green,
                  size: 30,
                ),
                SizedBox(
                  width: 20,
                ),
                RoundedButton(
                    color: Colors.orangeAccent,
                    press: () {},
                    text: "Contact us"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.logout,
                  color: Colors.green,
                  size: 30,
                ),
                SizedBox(
                  width: 20,
                ),
                RoundedButton(
                  color: Colors.lightBlue[600],
                  text: "Log out",
                  press: () {
                    _auth.signOut();
                    Get.offAll(LoginScreen1());
                  },
                ),
              ],
            ),
          ],
        ),
        //  ),
        // ],
      ),
      // ),
    );
  }
}
