import 'package:flutter/material.dart';
import 'package:flutter_posrestaurant_orderzen/routes/app_routes_named.dart';
import 'package:get/get.dart';
import 'package:flutter_posrestaurant_orderzen/controller/menu_controller.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final menuC = Get.isRegistered<MenusController>()
        ? Get.find<MenusController>()
        : Get.put(MenusController());

    return Scaffold(
      body: SizedBox(
        child: Column(
          children: [
            SizedBox(
              height: 150,
              child: Stack(
                children: [
                  Container(
                    height: 128,
                    width: double.infinity,
                    color: Color(0xff578FCA),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 24,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Menu Page',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Row(
                          children: const [
                            Icon(Icons.message, color: Colors.white),
                            SizedBox(width: 16),
                            Icon(Icons.notifications, color: Colors.white),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Obx(() {
              if (menuC.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              return Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 items per row
                    crossAxisSpacing: 16, // Horizontal space between items
                    mainAxisSpacing: 16, // Vertical space between items
                    childAspectRatio:
                        0.8, // Width/Height ratio (adjust as needed)
                  ),
                  itemCount: menuC.menus.length,
                  itemBuilder: (context, index) {
                    final item = menuC.menus[index];
                    return InkWell(
                      onTap: () {
                        Get.toNamed(
                          '${AppRoutesNamed.menuPage}/${menuC.menus[index].menuId}',
                        );
                      },
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(12),
                                ),
                                child: Image.asset(
                                  "assets/images/Menu.jpeg",
                                  height: 90,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    item.price.toString(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.green[700],
                                    ),
                                  ),
                                  // Obx(
                                  //   () => Row(
                                  //     mainAxisAlignment:
                                  //         MainAxisAlignment.center,
                                  //     children: [
                                  //       IconButton(
                                  //         icon: Icon(Icons.remove),
                                  //         iconSize: 12,
                                  //         onPressed: () => menuC
                                  //             .decreaseQuantity(item.menuId),
                                  //       ),
                                  //       Text(
                                  //         '${menuC.carts[item.menuId] ?? 0}',
                                  //       ),

                                  //       IconButton(
                                  //         icon: Icon(Icons.add),
                                  //         iconSize: 12,
                                  //         onPressed: () => menuC.updateQuantity(
                                  //           item.menuId,
                                  //           (menuC.carts[item.menuId] ?? 0) + 1,
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),

      floatingActionButton: Obx(() {
        return menuC.hasOrderItems
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  width: double.infinity, // Full width
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      Get.toNamed(AppRoutesNamed.orderPage);
                    },
                    icon: Icon(Icons.payment, color: Colors.white),
                    label: Text("Bayar", style: TextStyle(color: Colors.white)),
                    elevation: 2,
                    backgroundColor: Color(0xff578FCA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              )
            : SizedBox.shrink();
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
