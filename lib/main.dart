// ignore_for_file: prefer_const_constructors

import 'package:app_restaurante/model/providers.dart';
import 'package:app_restaurante/view/Cadastro/cadastro_page1.dart';
import 'package:app_restaurante/view/HomePage/home_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'view/login_page.dart';

// GoRouter configuration
final _router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/cadastro',
      builder: (context, state) => const CadastroPage(),
    ),
    GoRoute(
        path: '/home_page',
        builder: (context, state) => const HomePage(),
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              key: state.pageKey,
              child: HomePage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                // Animação de deslizar para a esquerda
                const begin =
                    Offset(1.0, 0.0); // Começa fora da tela, à direita
                const end = Offset.zero; // Termina na posição normal
                const curve = Curves.easeInOut; // Curva da animação

                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              });
        })
  ],
);

void main() {
  runApp(DevicePreview(
      enabled: true,
      builder: (context) => MultiProvider(providers: [
            ChangeNotifierProvider(create: (_) => UserData()),
            ChangeNotifierProvider(create: (_) => SweetInfo()),
            ChangeNotifierProvider(create: (_) => CarrinhoProvider()),
          ], child: const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
