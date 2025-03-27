import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CadastroPage3 extends StatelessWidget {
  const CadastroPage3({super.key});
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
                'Nos diga onde você mora',
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
                    'Digite seu endereço',
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
                      '3/5',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF2E2D2), // Bege Claro
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Digite sua cidade',
                            hintStyle: TextStyle(
                              color: Color(0xFFF8D0A4).withOpacity(0.7), // Pêssego Claro
                            ),
                            border: InputBorder.none,
                            icon: Icon(Icons.location_city, color: Color(0xFFF8D0A4)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF2E2D2), // Bege Claro
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Estado',
                            hintStyle: TextStyle(
                              color: Color(0xFFF8D0A4).withOpacity(0.7), // Pêssego Claro
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF2E2D2), // Bege Claro
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Digite sua rua',
                            hintStyle: TextStyle(
                              color: Color(0xFFF8D0A4).withOpacity(0.7), // Pêssego Claro
                            ),
                            border: InputBorder.none,
                            icon: Icon(Icons.add_road, color: Color(0xFFF8D0A4)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF2E2D2), // Bege Claro
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Número',
                            hintStyle: TextStyle(
                              color: Color(0xFFF8D0A4).withOpacity(0.7), // Pêssego Claro
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF2E2D2), // Bege Claro
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Apartamento, bloco ou complemento (opcional)',
                      hintStyle: TextStyle(
                        color: Color(0xFFF8D0A4).withOpacity(0.7), // Pêssego Claro
                      ),
                      border: InputBorder.none,
                      icon: Icon(Icons.home, color: Color(0xFFF8D0A4)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => context.go('/cad4'),
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
