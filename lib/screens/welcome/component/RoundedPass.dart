import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/welcome/component/textFieldcon.dart';

class RondedPasswordField extends StatelessWidget {
  final Function onChanged;
  final Function validator;
  final hint;

  const RondedPasswordField({
    Key key,
    this.onChanged,
    this.hint,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldCON(
      child: TextField(
        textAlign: TextAlign.left,
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
            hintText: "Password",
            prefixIcon: Icon(
              Icons.lock,
            ),
            suffixIcon: Icon(Icons.visibility),
            border: InputBorder.none),
      ),
    );
  }
}
