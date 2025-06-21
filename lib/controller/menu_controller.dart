import 'package:flutter/material.dart';
import 'package:flutter_posrestaurant_orderzen/model/menu_model.dart';
import 'package:flutter_posrestaurant_orderzen/model/order_model.dart';
import 'package:flutter_posrestaurant_orderzen/service/menu_service.dart';
import 'package:flutter_posrestaurant_orderzen/service/order_service.dart';
import 'package:get/get.dart';

class MenusController extends GetxController {
  final RxList<MenuModel> menus = <MenuModel>[].obs;
  final RxMap<int, int> cart = <int, int>{}.obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final Rx<MenuModel?> menu = Rx<MenuModel?>(null);
  bool get hasOrderItems => cart.values.any((qty) => qty > 0);

  double get totalAmount {
    print("GET TOTAL AMOUNT");
    double total = 0.0;
    cart.forEach((menuId, quantity) {
      final menu = menus.firstWhere((m) => m.menuId == menuId);
      total += menu.price * quantity;
    });
    return total;
  }

  @override
  void onInit() {
    super.onInit();
    fetchDataMenu();
  }

  void updateQuantity(int menuId, int newQuantity) {
    cart[menuId] = newQuantity;
    cart.refresh();
  }

  Future<String> placeOrder() async {
    String res = '';
    try {
      isLoading.value = true;

      final List<Map<String, dynamic>> orderItems = [];
      cart.forEach((menuId, quantity) {
        if (quantity > 0) {
          orderItems.add({"menu_id": menuId, "quantity": quantity});
        }
      });

      if (orderItems.isEmpty) {
        throw Exception("Cart is empty");
      }

      final response = await OrderService().order(
        tableNumber: 1,
        orderItems: orderItems,
      );

      res = response.linkPayment ?? "";
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
    return res;
  }

  Future<void> fetchDataMenu() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      menus.value = await MenuService().fetchMenu();

      print('Fetched ${menus.length} menu items');
    } catch (e) {
      errorMessage.value = 'Failed to load menus: ${e.toString()}';
      menus.clear(); // Clear old data on error
      print('Error fetching menus: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchDetailMenu() async {
    final menuId = Get.parameters["id"] != null
        ? int.parse(Get.parameters["id"]!)
        : 0;
    if (menuId == 0) {
      isLoading.value = false;
      return;
    }

    try {
      // isLoading.value = true;
      errorMessage.value = '';
      final fetchedMenus = await MenuService().fetchDetailMenu(menuId);

      menu.value = (fetchedMenus);
    } catch (e) {
      errorMessage.value = 'Failed to load menus: ${e.toString()}';

      print('Error fetching menus: $e');
    } finally {
      isLoading.value = false;
    }
  }
}

class MenuDetailController extends GetxController {
  late final int menuId;
  final Rx<MenuModel?> menu = Rx<MenuModel?>(null);
  final RxInt quantity = 1.obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    menuId = Get.parameters["id"] != null
        ? int.parse(Get.parameters["id"]!)
        : 0;
    if (menuId == 0) {
      isLoading.value = false;
      return;
    }
    fetchDataMenu();
  }

  void increaseQuantity() => quantity.value++;
  void decreaseQuantity() {
    if (quantity.value > 1) quantity.value--;
  }

  Future<void> fetchDataMenu() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final fetchedMenus = await MenuService().fetchDetailMenu(menuId);

      menu.value = (fetchedMenus);
    } catch (e) {
      errorMessage.value = 'Failed to load menus: ${e.toString()}';

      print('Error fetching menus: $e');
    } finally {
      isLoading.value = false;
    }
  }
}

class OrderListController extends GetxController {
  final RxList<OrderModel?> orders = <OrderModel?>[].obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDataOrder();
  }

  Future<void> fetchDataOrder() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final fetchOrders = await OrderService().fetchAllOrder();

      orders.value = (fetchOrders);
    } catch (e) {
      errorMessage.value = 'Failed to load order: ${e.toString()}';

      print('Error fetching order: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
