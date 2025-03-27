// ignore_for_file: prefer_const_constructors

import 'package:app_restaurante/services/providers.dart';
import 'package:app_restaurante/theme/app_theme.dart';
import 'package:app_restaurante/view/HomePage/sweets_page.dart';
import 'package:app_restaurante/view/cart_page.dart';
import 'package:app_restaurante/view/desc_page.dart';
import 'package:app_restaurante/view/favorites_page.dart';
import 'package:app_restaurante/view/login_page.dart';
import 'package:app_restaurante/view/Cadastro/cadastro_page1.dart';
import 'package:app_restaurante/view/Cadastro/cadastro_page2.dart';
import 'package:app_restaurante/view/Cadastro/cadastro_page3.dart';
import 'package:app_restaurante/view/Cadastro/cadastro_page4.dart';
import 'package:app_restaurante/view/Cadastro/cadastro_page5.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(DevicePreview(
      enabled: true,
      builder: (context) => MultiProvider(providers: [
            ChangeNotifierProvider(create: (_) => UserData()),
            ChangeNotifierProvider(create: (_) => SweetInfo()),
            ChangeNotifierProvider(create: (_) => CarrinhoProvider()),
            ChangeNotifierProvider(create: (_) => FavoritoProvider()),
            ChangeNotifierProvider(create: (_) => HomeProvider()),
            ChangeNotifierProvider(create: (_) => FavoritesProvider()),
            ChangeNotifierProvider(create: (_) => CartProvider()),
          ], child: const MyApp())));
}

final _router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => SweetsPage(),
    ),
    GoRoute(
      path: '/favorites',
      builder: (context, state) => FavoritesPage(),
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => CartPage(),
    ),
    GoRoute(
      path: '/desc',
      builder: (context, state) => DescPage(),
    ),
    GoRoute(
      path: '/cad1',
      builder: (context, state) => CadastroPage(),
    ),
    GoRoute(
      path: '/cad2',
      builder: (context, state) => CadastroPage2(),
    ),
    GoRoute(
      path: '/cad3',
      builder: (context, state) => CadastroPage3(),
    ),
    GoRoute(
      path: '/cad4',
      builder: (context, state) => CadastroPage4(),
    ),
    GoRoute(
      path: '/cad5',
      builder: (context, state) => CadastroPage5(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Confeitaria App',
      routerConfig: _router,
      theme: ThemeData(
        primaryColor: AppTheme.primaryColor,
        scaffoldBackgroundColor: AppTheme.backgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: AppTheme.primaryColor,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: AppTheme.titleStyle.copyWith(color: Colors.white),
        ),
        textTheme: TextTheme(
          displayLarge: AppTheme.titleStyle,
          displayMedium: AppTheme.subtitleStyle,
          bodyLarge: AppTheme.bodyTextStyle,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: AppTheme.primaryButtonStyle,
        ),
        cardTheme: CardTheme(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        inputDecorationTheme: AppTheme.inputDecorationTheme,
      ),
    );
  }
}
