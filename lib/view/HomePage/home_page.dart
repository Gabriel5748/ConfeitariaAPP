// ignore_for_file: prefer_const_constructors

import 'package:app_restaurante/view/HomePage/sweets_page.dart';
import 'package:app_restaurante/view/cart_page.dart';
import 'package:app_restaurante/view/favorites_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:app_restaurante/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:app_restaurante/services/providers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 1;
  bool isSearching = false;
  final TextEditingController _searchController = TextEditingController();

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

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Confirmar Saída',
            style: AppTheme.subtitleStyle,
          ),
          content: Text(
            'Tem certeza que deseja sair?',
            style: AppTheme.bodyTextStyle,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancelar',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Sair',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: AppTheme.primaryGradient,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 40),
                Consumer<UserData>(
                  builder: (context, user, child) {
                    return Text(
                      'Olá, ${user.username}',
                      style: AppTheme.titleStyle.copyWith(
                        color: Colors.white,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    onChanged: (value) {
                      context.read<HomeProvider>().updateSearchQuery(value);
                    },
                    decoration: InputDecoration(
                      hintText: 'Pesquisar doces...',
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.search,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListaDoces(),
          ),
        ],
      ),
    );
  }
}
