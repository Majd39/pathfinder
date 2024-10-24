import 'package:flutter/material.dart';

class Therd extends StatelessWidget {
  const Therd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/travel5.jpg",
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          const Center(
            child: Text(
              "Choose your ride ",
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
