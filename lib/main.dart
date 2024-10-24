import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pathfinder/splachscreen.dart';
import 'package:pathfinder/verfyemail.dart';
import 'package:pathfinder/view/Bookings/bookings.dart';
import 'package:pathfinder/view/Favorate/favorite.dart';
import 'package:pathfinder/view/Home/HomePage.dart';
import 'package:pathfinder/view/LogIn/logIn.dart';
import 'package:pathfinder/view/Register/signup.dart';
import 'package:pathfinder/view/mainPage/mainpage.dart';
import 'package:pathfinder/view/onbording/onBordingT.dart';

import 'Bindings/HomePageBinding.dart';
import 'Bindings/LogInBinding.dart';
import 'Bindings/MainPageBindings.dart';
import 'Bindings/OnboardingBindings.dart';
import 'Bindings/RegisterBindings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      getPages: [
        GetPage(
          name: "/splash",
          page: () =>  SplashScreen(),

        ),
        GetPage(
          name: "/Welcome",
          page: () =>  OnboardingScreen(),
          binding: Onboardingbindings(),
        ),
        GetPage(
            name: "/Register",
            page: () => SignUp(),
            binding: Registerbindings()),
        GetPage(
            name: "/LogIN", page: () => LoginPage(), binding: Loginbinding()),
        GetPage(
            name: "/Home", page: () =>  HomePage(), binding: HomePageBindings()),
        GetPage(
          name: "/Favorite",
          page: () => const FavoritePage(),
        ),
        GetPage(
          name: "/bookings",
          page: () => const CombinedReservationPage(),
        ),
        GetPage(
            name: "/mainPage",
            page: () => const MainPage(),
            binding: MainPageBinding()),
        GetPage(
            name: "/verifyEmailPage",
            page: () =>  VerifyEmailPage(),
            ),
      ],
    );
  }
}
