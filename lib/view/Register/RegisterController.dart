import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  // Firebase Authentication instance

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Variables to store user input (name, email, password)
  var name = "".obs;
  var email = "".obs;
  var password = "".obs;

  // Observables (variables that we can watch for changes)
  var isLoading = false.obs;  // Track if we're doing something
  var errorMessage = "".obs;  // To store error messages
  //
  // // Method to register a new user with email and password
  Future<void> registerUser() async {

    try {
      isLoading(true);  // Show loading indicator

      // Use Firebase's built-in method to create a new user
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );

      // After successful registration, get the user's info
      User? user = userCredential.user;

      if (user != null) {
        // User successfully registered, show a success message
        Get.snackbar("Success", "User Registered Successfully!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.offAllNamed("/LogIN");

      }
    } on FirebaseAuthException catch (e) {
      // If there's an error, like email already used or weak password, show an error message
      if (e.code == 'email-already-in-use') {
        errorMessage.value = 'This email is already in use!';
      } else if (e.code == 'weak-password') {
        errorMessage.value = 'Your password is too weak!';
      } else {
        errorMessage.value = 'Registration failed! Try again.';
      }

      // Show the error as a popup
      Get.snackbar("Error", errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);  // Hide loading indicator
    }
    print("email:$email +name:$name + password:$password");
  }
}
