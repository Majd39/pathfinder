import 'package:flutter/material.dart';

class CustumTitle extends StatelessWidget {
  const CustumTitle(
      {super.key, required this.text,
      required this.text2,
      required this.text3,
      required this.color,
      required this.color2,
      required this.color3});
  final String text;
  final String text2;
  final String text3;
  final Color color;
  final Color color2;
  final Color color3;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: text,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: color,
          ),
          children: [
            TextSpan(
              text: text2,
              style: TextStyle(color: color2, fontSize: 30),
            ),
            TextSpan(
              text: text3,
              style: TextStyle(color: color3, fontSize: 30),
            ),
          ]),
    );
  }
}
