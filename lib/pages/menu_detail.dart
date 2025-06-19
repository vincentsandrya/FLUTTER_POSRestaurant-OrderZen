import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_posrestaurant_orderzen/controller/menu_controller.dart';

class MenuDetailPage extends StatelessWidget {
  const MenuDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final menuC = Get.isRegistered<MenuDetailController>()
        ? Get.find<MenuDetailController>()
        : Get.put(MenuDetailController());

    return Scaffold(
      body: SizedBox(
        child: Column(
          children: [
            SizedBox(
              height: 120,
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
                        InkWell(
                          onTap: () => Get.back(),
                          child: const Text(
                            '< Menu Page',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
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
                return Center(child: CircularProgressIndicator());
              } else {
                final menu = menuC.menu.value!;
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image Section
                      Container(
                        height: 250,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/Menu.jpeg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      // Content Section
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              menu.categoryName.toUpperCase(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 8),

                            // Title
                            Text(
                              menu.name,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 16),

                            // Description
                            Text(
                              menu.description,
                              style: TextStyle(fontSize: 16, height: 1.5),
                            ),
                            SizedBox(height: 24),

                            // Price & Counter
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Price
                                Text(
                                  'Rp ${menu.price.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[700],
                                  ),
                                ),

                                // Counter
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.remove),
                                        onPressed: menuC.decreaseQuantity,
                                      ),
                                      Obx(
                                        () => Text(
                                          menuC.quantity.value.toString(),
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.add),
                                        onPressed: menuC.increaseQuantity,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
