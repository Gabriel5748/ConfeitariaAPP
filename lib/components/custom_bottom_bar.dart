import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_theme.dart';

class CustomBottomBar extends StatelessWidget {
  final int selectedIndex;

  const CustomBottomBar({
    super.key,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppTheme.primaryColor,
      currentIndex: selectedIndex,
      onTap: (index) {
        if (index == 0) {
          context.go('/favorites');
        } else if (index == 1) {
          context.go('/home');
        } else if (index == 2) {
          context.go('/cart');
        } else if (index == 3) {
          context.go('/profile');
        }
      },
      selectedItemColor: AppTheme.textColor,
      unselectedItemColor: AppTheme.textColor.withOpacity(0.7),
      type: BottomNavigationBarType.fixed,
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
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
    );
  }
} 