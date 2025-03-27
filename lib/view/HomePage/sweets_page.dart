// ignore_for_file: prefer_const_constructors

import 'package:app_restaurante/services/providers.dart';
import 'package:app_restaurante/theme/app_theme.dart';
import 'package:app_restaurante/model/classes/sweet_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class SweetsPage extends StatefulWidget {
  const SweetsPage({super.key});

  @override
  State<SweetsPage> createState() => _SweetsPageState();
}

class _SweetsPageState extends State<SweetsPage> {
  int selectedIndex = 1;
  bool isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  void onItemTap(int index) {
    setState(() {
      selectedIndex = index;
      if (index == 0) {
        context.go('/favorites');
      } else if (index == 1) {
        context.go('/');
      } else if (index == 2) {
        context.go('/cart');
      }
    });
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text(
            'Tem certeza que deseja sair?',
            style: AppTheme.bodyTextStyle,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                context.go('/login');
              },
              child: Text('Sair'),
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
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        centerTitle: true,
        title: isSearching
          ? TextField(
              controller: _searchController,
              style: TextStyle(color: AppTheme.textColor),
              decoration: InputDecoration(
                hintText: 'Buscar produtos...',
                hintStyle: TextStyle(color: AppTheme.textColor.withOpacity(0.7)),
                border: InputBorder.none,
              ),
              onChanged: (value) {
                context.read<HomeProvider>().updateSearchQuery(value);
              },
            )
          : Consumer<UserData>(
              builder: (context, userData, child) {
                return Text(
                  'Bem vindo ao CakeCup ${userData.username}',
                  style: AppTheme.titleStyle.copyWith(
                    color: AppTheme.textColor,
                    fontSize: 20,
                  ),
                );
              },
            ),
        actions: [
          IconButton(
            icon: Icon(isSearching ? Icons.close : Icons.search, color: AppTheme.textColor),
            onPressed: () {
              setState(() {
                isSearching = !isSearching;
                if (!isSearching) {
                  _searchController.clear();
                  context.read<HomeProvider>().updateSearchQuery('');
                }
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.logout, color: AppTheme.textColor),
            onPressed: _showLogoutDialog,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListaDoces(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppTheme.primaryColor,
        currentIndex: selectedIndex,
        onTap: onItemTap,
        selectedItemColor: AppTheme.textColor,
        unselectedItemColor: AppTheme.textColor.withOpacity(0.7),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart),
            activeIcon: Icon(CupertinoIcons.heart_fill),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.cart),
            activeIcon: Icon(CupertinoIcons.cart_fill),
            label: 'Carrinho',
          ),
        ],
      ),
    );
  }
}

class ListaDoces extends StatelessWidget {
  const ListaDoces({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        final doces = homeProvider.filteredDoces;

        if (doces.isEmpty) {
          return Center(
            child: Text(
              'Nenhum produto encontrado',
              style: AppTheme.titleStyle,
            ),
          );
        }

        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemCount: doces.length,
          itemBuilder: (context, index) {
            final doce = doces[index];
            return GestureDetector(
              onTap: () {
                context.read<SweetInfo>().updateDoce(
                  nome: doce.nome ?? '',
                  preco: doce.preco,
                  quantidade: doce.quantidade,
                  desc: doce.desc ?? '',
                  image: doce.image,
                  rating: doce.rating ?? 0.0,
                );
                context.push('/desc');
              },
              child: Container(
                decoration: AppTheme.cardDecoration,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        child: Image.asset(
                          doce.image,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            doce.nome ?? '',
                            style: AppTheme.subtitleStyle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: AppTheme.highlightColor,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${doce.rating?.toStringAsFixed(1) ?? '0.0'}',
                                style: AppTheme.bodyTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'R\$ ${doce.preco.toStringAsFixed(2)}',
                            style: AppTheme.titleStyle.copyWith(
                              color: AppTheme.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
