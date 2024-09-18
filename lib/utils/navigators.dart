//Arquivo criado para botar os Navigators aqui
import 'package:flutter/material.dart';

import '../view/cadastro_page.dart';

class Navigate {
  static cadastroPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const CadastroPage()));
  }
}
