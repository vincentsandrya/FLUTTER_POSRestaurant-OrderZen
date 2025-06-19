import 'package:dio/dio.dart';
import 'package:flutter_posrestaurant_orderzen/model/menu_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MenuService {
  final Dio _dio = Dio();

  final baseUrl = dotenv.env['API_URL'];

  Future<List<MenuModel>> fetchMenu() async {
    try {
      String url = '${baseUrl}menu';
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
        List<MenuModel> menus = List.from(
          data.map((menu) => MenuModel.fromJson(menu)),
        );
        return menus;
      }
      throw Exception(res.statusMessage);
    } catch (e) {
      rethrow;
    }
  }

  Future<MenuModel> fetchDetailMenu(int id) async {
    try {
      String url = '${baseUrl}menu/$id';
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
        MenuModel menus = MenuModel.fromJson(data);
        return menus;
      }
      throw Exception(res.statusMessage);
    } catch (e) {
      rethrow;
    }
  }
}
