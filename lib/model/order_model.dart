class OrderModel {
  final int orderId;
  final int totalAmount;
  final String orderStatus;
  final String? linkPayment;

  OrderModel(
    this.orderId,
    this.totalAmount,
    this.orderStatus,
    this.linkPayment
  );

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      json['order_id'],
      json['total_amount'],
      json['order_status'],
      json['link_payment']
    );
  }
}
