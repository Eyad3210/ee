import 'package:flutter/material.dart';

class TextHaveAccount extends StatelessWidget {
  final bool login;
  final Function press;

  const TextHaveAccount({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "   سجل الان" : "تسجيل الدخول",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        if (login) Text("   ليس لديك حساب؟") else Text("   لدي حساب"),
      ],
    );
  }
}
