// GoRouter configuration
import 'package:app_restaurante/view/Cadastro/cadastro_page2.dart';
import 'package:app_restaurante/view/Cadastro/cadastro_page3.dart';
import 'package:app_restaurante/view/Cadastro/cadastro_page4.dart';
import 'package:app_restaurante/view/Cadastro/cadastro_page5.dart';
import 'package:app_restaurante/view/desc_page.dart';
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
    GoRoute(path: '/cad1', builder: ((context, state) => const CadastroPage())),
    GoRoute(
        path: '/cad2', builder: ((context, state) => const CadastroPage2())),
    GoRoute(
        path: '/cad3', builder: ((context, state) => const CadastroPage3())),
    GoRoute(
        path: '/cad4', builder: ((context, state) => const CadastroPage4())),
    GoRoute(
        path: '/cad5', builder: ((context, state) => const CadastroPage5())),
    GoRoute(
        path: '/home_page',
        builder: (context, state) {
          return HomePage();
        },
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
        }),
    GoRoute(path: '/desc_page', builder: ((context, state) => const DescPage()))
  ],
);
