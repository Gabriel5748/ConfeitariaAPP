import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      backgroundColor: Color(0xFFF9C6D1), // Rosa Pastel
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Quais são seus doces favoritos?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFA8D8E8), // Azul Claro
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nos diga suas preferências',
                    style: TextStyle(
                      color: Color(0xFFE5C07B), // Dourado Claro
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Color(0xFFA8D8E8), // Azul Claro
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      '4/5',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: preferencias.entries.map((e) {
                  String nomePreferencia = e.key;
                  bool isSelected = e.value;
                  return FilterChip(
                    showCheckmark: false,
                    selected: isSelected,
                    label: Text(
                      nomePreferencia,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Color(0xFFF8D0A4),
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    onSelected: (bool value) {
                      setState(() {
                        preferencias[nomePreferencia] = value;
                        print(
                            'Preferência "$nomePreferencia" selecionada: ${preferencias[nomePreferencia]}');
                      });
                    },
                    backgroundColor: Color(0xFFF2E2D2), // Bege Claro
                    selectedColor: Color(0xFFA8D8E8), // Azul Claro
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(
                        color: isSelected ? Color(0xFFA8D8E8) : Color(0xFFF8D0A4),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  );
                }).toList(),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => context.go('/cad5'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFA8D8E8), // Azul Claro
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Próximo',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      CupertinoIcons.arrow_right,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
