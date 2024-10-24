import 'package:get/get.dart';

import '../view/mainPage/MainPageController.dart';

class MainPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainPageController>(() => MainPageController());
  }
}
