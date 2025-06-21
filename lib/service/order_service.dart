import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_posrestaurant_orderzen/model/order_model.dart';

class OrderService {
  final Dio _dio = Dio();

  final baseUrl = dotenv.env['API_URL'];

  Future<OrderModel> order({
    required int tableNumber,
    required List<Map<String, dynamic>> orderItems,
  }) async {
    try {
      final response = await _dio.post(
        '${baseUrl}order',
        data: {'table_number': tableNumber, 'order_item': orderItems},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'User-Agent': 'PostmanRuntime/7.44.0',
            'Accept': '*/*',
          },
        ),
      );

      if (response.statusCode == 200) {
        print(response);
        final data = response.data['data'];
        OrderModel order = OrderModel.fromJson(data);
        return order;
      } else {
        throw Exception("Failed login with status: ${response.statusCode}");
      }
    } on DioException catch (e) {
      if (e.response != null && e.response?.data != null) {
        // Error with response from server
        final errorMessage = e.response?.data['message'] ?? 'Login failed';
        throw Exception(errorMessage);
      } else {
        // Error without response (network, timeout, etc.)
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<List<OrderModel>> fetchAllOrder() async {
    try {
      String url = '${baseUrl}order';
      final res = await _dio.get(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'User-Agent':
                'PostmanRuntime/7.44.0', // optional, customize as needed
            'Accept': '*/*',
          },
          followRedirects: true,
          validateStatus: (status) => status! < 500,
        ),
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        final data = res.data['data'];
        return List<OrderModel>.from(data.map((order) => OrderModel.fromJson(order)))
          ..sort((a, b) => b.orderId.compareTo(a.orderId));
      }
      throw Exception(res.statusMessage);
    } catch (e) {
      rethrow;
    }
  }
}
