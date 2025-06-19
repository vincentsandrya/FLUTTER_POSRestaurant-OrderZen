import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class OrderService {
  final Dio _dio = Dio();

  final baseUrl = dotenv.env['API_URL'];

  Future<String> order() async {
    try {
      print("OrderService");
      final response = await _dio.post(
        '${baseUrl}order',
        data: {
          "table_number": 5,
          "order_item": [
            {"menu_id": 2, "quantity": 4},
            {"menu_id": 4, "quantity": 5},
          ],
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'User-Agent':
                'PostmanRuntime/7.44.0', // optional, customize as needed
            'Accept': '*/*',
          },
        ),
      );

      if (response.statusCode == 200) {
        print(response.data);
        return response.data['data']['message'];
        // final data = response.data['data'];
        // UserModel users = UserModel.fromJson(data);
        // return users;
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
}
