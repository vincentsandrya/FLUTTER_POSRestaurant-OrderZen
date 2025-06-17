import 'package:get/get.dart';
import 'package:flutter_posrestaurant_orderzen/controller/auth_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
