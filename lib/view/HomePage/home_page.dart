// ignore_for_file: prefer_const_constructors

import 'package:app_restaurante/view/HomePage/sweets_page.dart';
import 'package:app_restaurante/view/cart_page.dart';
import 'package:app_restaurante/view/favorites_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 1;

  static final List<Widget> _widgetOptions = <Widget>[
    Favorites(),
    SweetsPage(),
    CartPage(),
  ];

  void onItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff7b2cbf),
        currentIndex: selectedIndex,
        onTap: (index) => onItemTap(index),
        selectedItemColor: Colors.red[400],
        items: const [
          BottomNavigationBarItem(
              label: 'Favoritos', icon: Icon(CupertinoIcons.heart,color: Colors.white,)),
          BottomNavigationBarItem(label: 'Menu', icon: Icon(Icons.menu,color: Colors.white,)),
          BottomNavigationBarItem(
              label: 'Carrinho', icon: Icon(CupertinoIcons.cart,color: Colors.white,))
        ],
      ),
    );
  }
}
