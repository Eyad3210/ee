import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  final IconData icone;
  const RoundedButton({
    Key key,
    this.icone,
    this.text,
    this.press,
    this.color, //colorb,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.6,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          color: color,

          //ffa500 orange
          //Colors.blueAccent.withOpacity(0.8),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
          onPressed: press,

          //padding: const EdgeInsets.only(left: 40),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
