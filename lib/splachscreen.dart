import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pathfinder/constant/AppCollor.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Call checkAuth() when the widget is built
    Future.delayed(Duration(seconds: 2), () {
      checkAuth(); // Perform authentication check after splash screen
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [SizedBox(height: 100,),
Stack(children: [            Image.asset("assets/icon/logo.png"),
 Positioned(child:  CircularProgressIndicator(color: AppColor.primaryColor),top: 10,bottom: 5,left: 10,right: 10,)],)
          ],
        ),
      ),
    );
  }

  // Method to check if the user is authenticated and if the email is verified
  void checkAuth() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // User is signed in, now check email verification
      if (user.emailVerified) {
        // If email is verified, navigate to HomePage
        Get.offAllNamed("/mainPage");
      } else {
        // If email is not verified, navigate to an email verification page
        Get.offAllNamed("/verifyEmailPage");
      }
    } else {
      // If user is not signed in, navigate to login page
      Get.offAllNamed("/Welcome");
    }
  }
}
