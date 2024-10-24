import 'package:flutter/material.dart';

class Forth extends StatelessWidget {
  const Forth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/travel4.jpg",
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          const Center(
            child: Text(
              "Choose a place to stay ",
              style: TextStyle(
                  color: Color(0xFFD35400),
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
