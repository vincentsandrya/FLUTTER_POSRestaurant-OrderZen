import "package:flutter/material.dart";
import "package:flutter_posrestaurant_orderzen/controller/menu_controller.dart";
import "package:flutter_posrestaurant_orderzen/routes/app_routes_named.dart";
import "package:get/get.dart";
import "package:url_launcher/url_launcher.dart";

class OrderPage extends StatelessWidget {
  OrderPage({super.key});
  final MenusController menuC = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 120,
            child: Stack(
              children: [
                Container(
                  height: 120,
                  width: double.infinity,
                  color: Color(0xff578FCA),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
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

          Column(
            children: [
              Obx(() {
                final items = menuC.cart.entries
                    .where((e) => e.value > 0)
                    .toList();
                return Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: items.length,
                      itemBuilder: (_, index) {
                        final menu = menuC.menus.firstWhere(
                          (m) => m.menuId == items[index].key,
                        );
                        return ListTile(
                          title: Text(menu.name),
                          trailing: Text(
                            '${items[index].value} x ${menu.price}',
                          ),
                        );
                      },
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text("Total Amount"),
                      trailing: Text(menuC.totalAmount.toString()),
                    ),
                  ],
                );
              }),

              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(8),
              //     ),
              //     backgroundColor: Color(0xff3498DB),
              //   ),
              //   onPressed: () async {
              //     final paymentUrl = await menuC.placeOrder();
              //     if (paymentUrl != '') {
              //       await launchUrl(Uri.parse(paymentUrl)).then((_) {
              //         menuC.cart.clear();
              //         Get.offAllNamed(AppRoutesNamed.mainPage);
              //       });
              //     }
              //   },
              //   child: Text("Pay Now", style: TextStyle(color: Colors.white)),
            ],
          ),
        ],
      ),
      floatingActionButton: Obx(() {
        return menuC.totalAmount > 0
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  width: double.infinity, // Full width
                  child: FloatingActionButton.extended(
                    onPressed: () async {
                      final paymentUrl = await menuC.placeOrder();
                      if (paymentUrl != '') {
                        await launchUrl(Uri.parse(paymentUrl)).then((_) {
                          menuC.cart.clear();
                          Get.offAllNamed(AppRoutesNamed.mainPage);
                        });
                      }
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
