import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pathfinder/view/LogIn/LOGinCONTROLLER.dart';
import '../../component/Title.dart';
import '../../component/bezierContainer.dart';
import '../../component/customfieldform.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  // final TextEditingController usernameController = TextEditingController();
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();

  static GlobalKey<FormState> formState = GlobalKey<FormState>();
  LoginController loginController=LoginController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SizedBox(
        height: height,
        child: Stack(
          children: [
            Positioned(
              top: -height * .19,
              right: -MediaQuery.of(context).size.width * .4,
              child: const BezierContainer(),
            ),
            Form(
              key: formState,
              child: ListView(
                children: [
                  const SizedBox(height: 100),
                  const CustumTitle(
                    text: "P", color: Color(0xFFD35400),
                    text2: "ath", color2: Colors.black,
                    text3: "finder", color3: Color(0xFFD35400),
                  ),
                  const SizedBox(height: 40),


                  const SizedBox(height: 5),

                  // Email Field
                  SizedBox(height: 100,child:  CustomFieldForm(
                    validator: (val) {
                      if (val == "") {
                        return "Your email is required";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (val) {
                      loginController.emailAddress.value = val; // Link to controller
                    },
                    suffixIcon: const Icon(Icons.email),
                    keybourdtype: TextInputType.emailAddress,
                    lable: 'Email',
                  ),),

                  const SizedBox(height: 5),

                  // Password Field
                  SizedBox(height: 100,child:    CustomFieldForm(
                    validator: (val) {
                      if (val == "") {
                        return "Your password is required";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (val) {
                      loginController.password.value = val; // Link to controller
                    },
                    suffixIcon: const Icon(Icons.lock_outline),
                    keybourdtype: TextInputType.visiblePassword,
                    obscureText: true, // Hides the password
                    lable: 'Password',
                  ),),

                  const SizedBox(height: 5),

                  // Register Button
                  Padding(
                    padding: const EdgeInsets.all(60),
                    child: GestureDetector(
                      onTap: () {
                        if (formState.currentState!.validate()) {
                          // Call the registerUser method from the controller
                          loginController.login();
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(40)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              offset: const Offset(2, 4),
                              blurRadius: 5,
                              spreadRadius: 2,
                            ),
                          ],
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Color(0xfffbb448), Color(0xfff7892b)],
                          ),
                        ),
                        child: const Text(
                          'Login ',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Redirect to Login
                  Center(
                    child:Column(children: [
                      Row(                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [  const Text("reset password"),
                          TextButton(
                            onPressed: () {
                              if(formState.currentState!.validate())
                            {  loginController.resetPassword();}
                            },
                            child: const Text(
                              "Reset",
                              style: TextStyle(color: Color(0xFFD35400)),
                            ),
                          ),],),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("You don`t have an account?"),
                        TextButton(
                          onPressed: () {
                            Get.offNamed("/Register");
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(color: Color(0xFFD35400)),
                          ),
                        ),

                      ],

                    ),
                      IconButton(onPressed: () async{




                      }, icon: Icon(EvaIcons.google,color: Colors.green,size: 41,))

                    ],),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
