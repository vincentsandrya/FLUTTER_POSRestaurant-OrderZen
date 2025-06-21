import 'package:flutter/material.dart';
import 'package:flutter_posrestaurant_orderzen/pages/account.dart';
import 'package:flutter_posrestaurant_orderzen/pages/home.dart';
import 'package:flutter_posrestaurant_orderzen/pages/menu/menu_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _children = [HomePage(), MenuPage(), AccountPage()];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xffF1F1F1),
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        selectedItemColor: Color(0xff578FCA),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Menu'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
    );
  }
}
