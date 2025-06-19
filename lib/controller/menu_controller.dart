import 'package:flutter_posrestaurant_orderzen/model/menu_model.dart';
import 'package:flutter_posrestaurant_orderzen/service/menu_service.dart';
import 'package:get/get.dart';

class MenusController extends GetxController {
  final RxList<MenuModel> menus = <MenuModel>[].obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDataMenu();
  }

  Future<void> fetchDataMenu() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final fetchedMenus = await MenuService().fetchMenu();

      // Use assignAll for better performance with RxList
      menus.assignAll(fetchedMenus);

      print('Fetched ${menus.length} menu items');
    } catch (e) {
      errorMessage.value = 'Failed to load menus: ${e.toString()}';
      menus.clear(); // Clear old data on error
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
