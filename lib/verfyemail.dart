import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Verify Email")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Please verify your email address."),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Resend verification email
                User? user = FirebaseAuth.instance.currentUser;
                if (user != null && !user.emailVerified) {
                  await user.sendEmailVerification();
                  Get.snackbar("Email Sent", "A verification email has been sent to ${user.email}",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.green,
                    colorText: Colors.white,
                  );
                }
              },
              child: Text("Resend Verification Email"),
            ),
            ElevatedButton(
              onPressed: () async {
                // Check if the email is verified
                await FirebaseAuth.instance.currentUser?.reload();
                User? user = FirebaseAuth.instance.currentUser;
                if (user != null && user.emailVerified) {
                  // If the email is verified, go to HomePage
                  Get.offAllNamed("/mainPage");
                } else {
                  Get.snackbar("Not Verified", "Your email is still not verified.",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                }
              },
              child: Text("I Have Verified"),
            ),
          ],
        ),
      ),
    );
  }
}
