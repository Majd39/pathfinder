import 'package:flutter/material.dart';

class First extends StatelessWidget {
  const First({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/travel1.jpg",
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Wellcome to Pathfinder",
                  style: TextStyle(
                      color: Color(0xFFD35400),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Choose your destination",
                  style: TextStyle(
                      color: Color(0xFFD35400),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
