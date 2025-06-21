// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_posrestaurant_orderzen/model/order_model.dart';
// import 'package:flutter_posrestaurant_orderzen/routes/app_routes_named.dart';
import 'package:get/get.dart';
import 'package:flutter_posrestaurant_orderzen/controller/menu_controller.dart';

class OrderListPage extends StatelessWidget {
  const OrderListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final orderC = Get.isRegistered<OrderListController>()
        ? Get.find<OrderListController>()
        : Get.put(OrderListController());

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
                          'History Page',
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
              if (orderC.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              return Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.all(16),
                  itemCount: orderC.orders.length,
                  separatorBuilder: (_, __) => Divider(height: 24),
                  itemBuilder: (_, index) {
                    final order = orderC.orders[index];
                    return _buildOrderCard(order!);
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

Widget _buildOrderCard(OrderModel order) {
  return Card(
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.store, size: 24, color: Colors.blue),
              Spacer(),
              _buildStatusBadge(order.orderStatus),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Icon(Icons.receipt, size: 20, color: Colors.grey),
              SizedBox(width: 8),
              Text("Order ID: ${order.orderId}"),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.money, size: 20, color: Colors.grey),
              SizedBox(width: 8),
              Text(
                "Total: Rp${order.totalAmount.toStringAsFixed(0)}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green[700],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _buildStatusBadge(String status) {
  final color = _getStatusColor(status);
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      color: color.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      status.toUpperCase(),
      style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold),
    ),
  );
}

Color _getStatusColor(String status) {
  print(status);
  switch (status) {
    case "Paid":
      return Colors.green;
    case "Waiting for Payment":
      return Colors.orange;
    case "Cancelled":
      return Colors.red;
    default:
      return Colors.grey;
  }
}
