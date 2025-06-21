import 'package:flutter_posrestaurant_orderzen/bindings/auth.binding.dart';
import 'package:flutter_posrestaurant_orderzen/bindings/menu_binding.dart';
import 'package:flutter_posrestaurant_orderzen/pages/account.dart';
import 'package:flutter_posrestaurant_orderzen/pages/base/buttom_navbar.dart';
import 'package:flutter_posrestaurant_orderzen/pages/home.dart';
import 'package:flutter_posrestaurant_orderzen/pages/menu/menu_page.dart';
import 'package:flutter_posrestaurant_orderzen/pages/menu/menu_detail.dart';
import 'package:flutter_posrestaurant_orderzen/pages/menu/order_list_page.dart';
import 'package:flutter_posrestaurant_orderzen/pages/menu/order_page.dart';
import 'package:get/route_manager.dart';
import 'package:flutter_posrestaurant_orderzen/routes/app_routes_named.dart';
import 'package:flutter_posrestaurant_orderzen/pages/base/get_started.dart';
import 'package:flutter_posrestaurant_orderzen/pages/base/login.dart';
import 'package:flutter_posrestaurant_orderzen/pages/base/signup.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: AppRoutesNamed.getStartedPage, page: () => GetStartedPage()),
    GetPage(
      name: AppRoutesNamed.loginPage,
      page: () => LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutesNamed.registerPage,
      page: () => RegisterPage(),
      binding: AuthBinding(),
    ),
    GetPage(name: AppRoutesNamed.mainPage, page: () => BottomNavBar()),
    GetPage(name: AppRoutesNamed.homePage, page: () => HomePage()),
    GetPage(
      name: AppRoutesNamed.menuPage,
      page: () => MenuPage(),
      binding: MenuBinding(),
    ),
    GetPage(
      name: AppRoutesNamed.menuDetailPage,
      page: () => MenuDetailPage(),
      binding: MenuBinding(),
    ),
    GetPage(
      name: AppRoutesNamed.orderPage,
      page: () => OrderPage(),
      binding: MenuBinding(),
    ),
    GetPage(
      name: AppRoutesNamed.orderListPage,
      page: () => OrderListPage(),
      binding: MenuBinding(),
    ),
    GetPage(name: AppRoutesNamed.accountPage, page: () => AccountPage()),
  ];
}
