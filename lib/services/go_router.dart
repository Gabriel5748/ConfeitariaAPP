// GoRouter configuration
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../view/Cadastro/cadastro_page1.dart';
import '../view/HomePage/home_page.dart';
import '../view/login_page.dart';

final router = GoRouter(
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
              child: const HomePage(),
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