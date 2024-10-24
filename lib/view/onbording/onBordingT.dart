// OnboardingScreen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pathfinder/view/onbording/second.dart';
import 'package:pathfinder/view/onbording/third.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'SplachScreenController.dart';
import 'first.dart';
import 'forth.dart'; // Ensure this import path is correct

class OnboardingScreen extends StatelessWidget {
  final OnboardingController onboardingController = Get.find();

  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: onboardingController.pageController,
            children: const [First(), Second(), Therd(), Forth()], // Ensure 'Third()' is correctly spelled
          ),
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: onboardingController.pageController,
                count: 4,
                effect: const WormEffect(),
                onDotClicked: (index) {
                  onboardingController.pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Get.toNamed("/Register");
        },
        child: Container(
          width: 150,
          height: 70,
          decoration: BoxDecoration(
            color: const Color(0xFFD35400),
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Center(
            child: Text(
              "Get Started",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
