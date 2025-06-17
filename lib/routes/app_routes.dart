import 'package:flutter_posrestaurant_orderzen/bindings/auth.binding.dart';
import 'package:flutter_posrestaurant_orderzen/bindings/menu_binding.dart';
import 'package:flutter_posrestaurant_orderzen/pages/account.dart';
import 'package:flutter_posrestaurant_orderzen/pages/base/buttom_navbar.dart';
import 'package:flutter_posrestaurant_orderzen/pages/home.dart';
import 'package:flutter_posrestaurant_orderzen/pages/menu.dart';
import 'package:flutter_posrestaurant_orderzen/pages/menu_detail.dart';
import 'package:get/route_manager.dart';
import 'package:flutter_posrestaurant_orderzen/routes/app_routes_named.dart';
import 'package:flutter_posrestaurant_orderzen/pages/base/get_started.dart';
import 'package:flutter_posrestaurant_orderzen/pages/base/login.dart';
import 'package:flutter_posrestaurant_orderzen/pages/base/signup.dart';
// import 'package:flutter_posrestaurant_orderzen/user/binding/user_binding.dart';
// import 'package:flutter_posrestaurant_orderzen/user/page/detail_user_page.dart';
// import 'package:flutter_posrestaurant_orderzen/user/page/user_page.dart';
// import 'package:flutter_posrestaurant_orderzen/search_page.dart';
// import 'package:flutter_posrestaurant_orderzen/setting_page.dart';
// import 'package:flutter_posrestaurant_orderzen/detail_news.dart';
// import 'package:flutter_posrestaurant_orderzen/home_page.dart';
// import 'package:flutter_posrestaurant_orderzen/main.dart';

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
    GetPage(name: AppRoutesNamed.accountPage, page: () => AccountPage()),
    // GetPage(name: AppRoutesNamed.searchPage, page: () => SearchPage()),
    // GetPage(name: AppRoutesNamed.settingPage, page: () => SettingPage()),
    // GetPage(name: AppRoutesNamed.detailNews, page: () => DetailNews()),
    // GetPage(
    //   name: AppRoutesNamed.userPage,
    //   page: () => UserPage(),
    //   // binding: UserBinding(),
    // ),
    // GetPage(name: AppRoutesNamed.userDetailPage, page: () => DetailUserPage()),
    // GetPage(name: AppRoutesNamed.loginPage, page: () => LoginPage()),
    // GetPage(name: AppRoutesNamed.registerPage, page: () => RegisterPage()),
  ];
}


    //     '/home': (context) => HomePage(),
    //     '/search': (context) => SearchPage(),
    //     '/setting': (context) => SettingPage(),
    //     '/detail_news': (context) => DetailNews(),
    //     '/user': (context) => UserPage(),
    //     '/login': (context) => LoginPage(),
    //     '/register': (context) => RegisterPage(),
    //     '/main': (context) => BottomNavBar(),