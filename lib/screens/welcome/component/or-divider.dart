import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/firstScreen/navBar.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class OrDivider extends StatelessWidget {
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.8,
      child: Column(
        children: [
          Row(
            children: <Widget>[
              buildDivider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "OR",
                  style: TextStyle(
                    color: Colors.orangeAccent,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              buildDivider(),
            ],
          ),
          SizedBox(height: 20),
          InkWell(
            child: Image.asset("assest/images/google.png",
                width: size.width * 0.08),
            onTap: () async {
              UserCredential cred = await signInWithGoogle();
              print(cred);
            },
          )
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return Expanded(
      child: Divider(
        color: Colors.black,
        height: 1.5,
      ),
    );
  }
}
