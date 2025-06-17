import 'package:dio/dio.dart';
import 'package:flutter_posrestaurant_orderzen/model/user_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthService {
  final Dio _dio = Dio();

  final baseUrl = dotenv.env['API_URL'];
  
  Future<UserModel> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '${baseUrl}login',
        data: {"email": email, "password": password},
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
        final data = response.data['data'];
        UserModel users = UserModel.fromJson(data);
        return users;
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

  Future<UserModel> register(String name, String email, String password) async {
    try {
      final response = await _dio.post(
        '${baseUrl}register',
        data: {"name": name, "email": email, "password": password},
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
        final data = response.data['data'];
        UserModel users = UserModel.fromJson(data);
        return users;
      } else {
        throw Exception("Failed register with status: ${response.statusCode}");
      }
    } on DioException catch (e) {
      if (e.response != null && e.response?.data != null) {
        // Error with response from server
        final errorMessage = e.response?.data['message'] ?? 'Register failed';
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
