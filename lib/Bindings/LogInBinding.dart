import 'package:get/get.dart';

import '../view/LogIn/LOGinCONTROLLER.dart';

class Loginbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
