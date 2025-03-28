import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../services/providers.dart';

class CadastroPage5 extends StatelessWidget {
  const CadastroPage5({super.key});
  @override
  Widget build(BuildContext context) {
    final aboutController = TextEditingController();
    final userInfo = Provider.of<UserData>(context);

    void saveAndFinish() {
      if (aboutController.text.isNotEmpty) {
        userInfo.setAbout(aboutController.text);
      }
      userInfo.cadastrarUsuario();
      context.go('/home');
    }

    return Scaffold(
      backgroundColor: Color(0xFFF9C6D1), // Rosa Pastel
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Text(
                  'Quase lá!',
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
                      'Fale um pouco sobre você!',
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
                        '5/5',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
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
                      controller: aboutController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: 'Conte-nos sobre seus gostos, hobbies e o que mais quiser compartilhar!',
                        hintStyle: TextStyle(
                          color: Color(0xFFF8D0A4).withOpacity(0.7), // Pêssego Claro
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => context.go('/cad4'),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            color: Color(0xFFA8D8E8), // Azul Claro
                          ),
                          Text(
                            'Voltar',
                            style: TextStyle(
                              color: Color(0xFFA8D8E8), // Azul Claro
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: saveAndFinish,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFA8D8E8), // Azul Claro
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        'Finalizar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
