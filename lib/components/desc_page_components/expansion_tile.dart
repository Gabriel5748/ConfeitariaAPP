//Arquivo para expansions Tile da página de descrição

// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpansionTileDescPage extends StatefulWidget {
  const ExpansionTileDescPage({super.key});

  @override
  State<ExpansionTileDescPage> createState() => _ExpansionTileDescPageState();
}

class _ExpansionTileDescPageState extends State<ExpansionTileDescPage> {
  bool isExpanded = false;

  Map<String, bool> secoes = {
    "Modo de Preparo": false,
    "Informações Nutricionais": false,
    "História do Prato": false,
    "Avaliação dos Cllientes": false
  };

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: secoes.length,
      itemBuilder: (context, index) {
        String nomeSecao =
            secoes.keys.elementAt(index);
        bool isExpanded = secoes[nomeSecao]!;

        return ExpansionTile(
          title: Text(nomeSecao),
          trailing: isExpanded
              ? const Icon(CupertinoIcons.chevron_up)
              : const Icon(CupertinoIcons.chevron_down),
          onExpansionChanged: (bool changed) {
            setState(() {
              secoes[nomeSecao] = changed;
            });
          },
          children: [
            Text('Conteúdo da seção $nomeSecao'),
            Text('Conteúdo da seção $nomeSecao'),
            Text('Conteúdo da seção $nomeSecao'),
            Text('Conteúdo da seção $nomeSecao'),
            Text('Conteúdo da seção $nomeSecao'),
          ],
        );
      },
    );
  }
}
