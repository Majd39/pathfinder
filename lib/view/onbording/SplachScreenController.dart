// OnboardingController.dart

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  PageController pageController = PageController();
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    print("OnboardingController initialized");

    // Ensure PageView is built before starting the auto-scroll
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 100), () {
        _startAutoScroll();
      });
    });
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (pageController.hasClients && pageController.positions.isNotEmpty) {
        int currentPage = pageController.page!.round(); // Safely access page
        print("Current Page: $currentPage"); // Debugging log
        if (currentPage >= 3) {
          // Last page (assuming 0-based index)
          pageController.jumpToPage(0); // Go back to the first page
        } else {
          pageController.nextPage(
            duration: const Duration(milliseconds: 500), // Increased duration for smooth transition
            curve: Curves.easeInOut,
          );
        }
      } else {
        print("PageController not ready"); // Debugging log
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel(); // Cancel the timer when disposing the widget
    pageController.dispose();
    super.onClose();
  }
}
