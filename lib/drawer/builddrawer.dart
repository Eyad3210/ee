import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Login/LoginScreen.dart';

class Mydrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Drawer(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.orange, Colors.blueAccent])),
          child: ListView(
            children: [
              SizedBox(height: 12),
              ListTile(
                title: Text(
                  "معلومات اللحساب",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                leading: Icon(
                  Icons.info_rounded,
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  "الاشعارات",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                leading: Icon(
                  Icons.notifications_rounded,
                ),
                onTap: () {},
              ),
              Divider(color: Colors.white70),
              ListTile(
                title: Text(
                  "تسجيل الخروج",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                leading: Icon(Icons.logout),
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (BuildContext context) {
                    return LoginScreen1();
                  }));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
