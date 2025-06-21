import 'package:flutter_posrestaurant_orderzen/controller/menu_controller.dart';
import 'package:get/get.dart';

class MenuBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenusController>(() => MenusController());
    // Get.lazyPut<MenuDetailController>(() => MenuDetailController());
    Get.lazyPut<OrderListController>(() => OrderListController());
  }
}
