import 'package:app_restaurante/utils/navigators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/chips_data.dart';

class CadastroPage4 extends StatefulWidget {
  const CadastroPage4({super.key});

  @override
  State<CadastroPage4> createState() => _CadastroPage4State();
}

class _CadastroPage4State extends State<CadastroPage4> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Nos diga suas preferências',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '4/5',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w800),
                )
              ],
            ),
            ...preferencias.entries.map((e) {
              String nomePreferencia = e.key;
              bool isSelected = e.value;
              return SizedBox(
                child: FilterChip(
                  showCheckmark: false,
                  selected: isSelected,
                  label: Text(nomePreferencia),
                  onSelected: (bool value) {
                    setState(() {
                      preferencias[nomePreferencia] = value;
                      print(
                          'Preferência "$nomePreferencia" selecionada: ${preferencias[nomePreferencia]}');
                    });
                  },
                  backgroundColor: Colors.white,
                  selectedColor: Colors.purple[100],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide()),
                ),
              );
            }),
            OutlinedButton(
                onPressed: () => Navigate.cadastroPage5(context),
                child: const Icon(
                  CupertinoIcons.arrow_right_square_fill,
                ))
          ],
        ),
      ),
    );
  }
}
