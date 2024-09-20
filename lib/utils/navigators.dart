//Arquivo criado para botar os Navigators aqui
import 'package:app_restaurante/view/Cadastro/cadastro_page2.dart';
import 'package:app_restaurante/view/HomePage/home_page.dart';
import 'package:app_restaurante/view/login_page.dart';
import 'package:flutter/material.dart';

import '../view/Cadastro/cadastro_page1.dart';
import '../view/Cadastro/cadastro_page3.dart';
import '../view/Cadastro/cadastro_page4.dart';
import '../view/Cadastro/cadastro_page5.dart';

abstract class Navigate {
  static cadastroPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const CadastroPage()));
  }

  static cadastroPage2(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const CadastroPage2()));
  }

  static cadastroPage3(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const CadastroPage3()));
  }

  static cadastroPage4(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const CadastroPage4()));
  }

  static cadastroPage5(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const CadastroPage5()));
  }

  static loginPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  static homePage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const HomePage()));
  }
}
