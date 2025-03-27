import 'package:app_restaurante/model/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../services/providers.dart';

class CadastroPage2 extends StatelessWidget {
  const CadastroPage2({super.key});
  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<UserData>(context);
    final emailController = TextEditingController();
    final pass1Controller = TextEditingController();
    final pass2Controller = TextEditingController();
    final formKey = GlobalKey<FormState>();

    void setData(String email, String password) {
      if (formKey.currentState!.validate()) {
        userInfo.setEmail(email);
        userInfo.setPassWord(password);
        userInfo.cadastrarUsuario();
        context.go('/cad3');
      }
    }

    return Scaffold(
      backgroundColor: Color(0xFFF9C6D1), // Rosa Pastel
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Seja bem-vindo(a), ${userInfo.username}!',
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
                      'Crie uma conta',
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
                        '2/5',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
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
                    child: TextFormField(
                      validator: (value) => ValidateEmail.validate(value!),
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Digite seu email',
                        hintStyle: TextStyle(
                          color: Color(0xFFF8D0A4).withOpacity(0.7), // Pêssego Claro
                        ),
                        border: InputBorder.none,
                        icon: Icon(Icons.email, color: Color(0xFFF8D0A4)),
                      ),
                    ),
                  ),
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
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, digite uma senha';
                        }
                        if (value.length < 6) {
                          return 'A senha deve ter pelo menos 6 caracteres';
                        }
                        return null;
                      },
                      controller: pass1Controller,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Digite sua senha',
                        hintStyle: TextStyle(
                          color: Color(0xFFF8D0A4).withOpacity(0.7), // Pêssego Claro
                        ),
                        border: InputBorder.none,
                        icon: Icon(Icons.lock, color: Color(0xFFF8D0A4)),
                      ),
                    ),
                  ),
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
                    child: TextFormField(
                      validator: (value) {
                        if (value != pass1Controller.text) {
                          return 'As senhas não coincidem';
                        }
                        return null;
                      },
                      controller: pass2Controller,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Confirme sua senha',
                        hintStyle: TextStyle(
                          color: Color(0xFFF8D0A4).withOpacity(0.7), // Pêssego Claro
                        ),
                        border: InputBorder.none,
                        icon: Icon(Icons.lock_outline, color: Color(0xFFF8D0A4)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () => setData(emailController.text, pass1Controller.text),
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
      ),
    );
  }
}
