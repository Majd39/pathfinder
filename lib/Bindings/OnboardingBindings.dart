import 'package:get/get.dart';

import '../view/onbording/SplachScreenController.dart';

class Onboardingbindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(() => OnboardingController());
  }
}
