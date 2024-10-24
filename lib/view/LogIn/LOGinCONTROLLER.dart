import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var emailAddress = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;
  var errorMessage = "".obs;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> login() async {
    try {
      isLoading(true);

      // Attempt to sign in
      final credential = await auth.signInWithEmailAndPassword(
        email: emailAddress.value,
        password: password.value,
      );
      User? user = credential.user;

      // Check if user exists and email is verified
      if (user != null ) {
        if (user.emailVerified) {
          // If the email is verified, proceed to the home page
          Get.snackbar(
            "Success",
            "User logged in successfully!",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          Get.offAllNamed("/mainPage");
        } else {
          // If email is not verified, prompt the user to verify their email
          Get.snackbar(
            "Email Not Verified",
            "Please verify your email before proceeding.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.orange,
            colorText: Colors.white,
          );

          // Send verification email
          await user.sendEmailVerification();

          // Log out the user
          await FirebaseAuth.instance.signOut();

          Get.snackbar(
            "Verification Email Sent",
            "A verification email has been sent to ${user.email}. Please check your inbox.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.blue,
            colorText: Colors.white,
          );
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          "Error:",
          "user not found please rigester",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          "Error:",
          "Wrong password please try again or reset your password",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
      else if (e.code == 'The email address is badly formatted.') {
        Get.snackbar(
          "Error:",
          "The email address is badly formatted.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }

    } finally {
      isLoading(false); // Hide loading indicator
    }
  }
Future<void> resetPassword()async{
  if (emailAddress.value.isNotEmpty) {
    try {
      await auth.sendPasswordResetEmail(email: emailAddress.value);
      Get.snackbar("Success", "Password reset email has been sent!");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  } else {
    Get.snackbar("Error", "Please enter a valid email address.");
  }
}
}

