// import 'package:flutter_posrestaurant_orderzen/model/user_model.dart';
import 'package:flutter_posrestaurant_orderzen/service/auth_service.dart';
import 'package:flutter_posrestaurant_orderzen/service/order_service.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart'; // Still needed for Colors

class AuthController extends GetxController {
  var name = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;

  Future<void> login() async {
    try {
      isLoading.value = true;

      final res2 = await OrderService().order();
      final response = await AuthService().login(email.value, password.value);

      print(res2);

      name.value = response.name;

      Get.offAllNamed(
        '/main',
      ); // or Get.toNamed(...) if you don’t want to clear backstack
    } catch (e) {
      Get.snackbar(
        'Login Failed',
        e.toString(),
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> register() async {
    try {
      isLoading.value = true;

      final response = await AuthService().register(
        name.value,
        email.value,
        password.value,
      );

      name.value = response.name;

      Get.offAllNamed(
        '/main',
      ); // or Get.toNamed(...) if you don’t want to clear backstack
    } catch (e) {
      Get.snackbar(
        'Register Failed',
        e.toString(),
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
