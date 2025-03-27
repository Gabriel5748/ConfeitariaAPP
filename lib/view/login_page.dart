// ignore_for_file: prefer_const_constructors

import 'package:app_restaurante/model/classes/chip_class.dart';
import 'package:app_restaurante/services/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../model/classes/sweet_class.dart';
import '../model/classes/user_class.dart';
import 'forgot_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    Doces.getDados();
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Erro de Login'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _login() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final userInfo = Provider.of<UserData>(context, listen: false);
      
      // Simula uma verificação de login
      bool loginValido = false;
      String? nomeUsuario;

      // Verifica se as credenciais correspondem a algum usuário cadastrado
      if (userInfo.verificarCredenciais(emailController.text, passwordController.text)) {
        loginValido = true;
        nomeUsuario = userInfo.username;
      }

      // Simula um delay de rede
      await Future.delayed(Duration(seconds: 1));

      setState(() {
        _isLoading = false;
      });

      if (loginValido) {
        context.go('/');
      } else {
        _showErrorDialog('Email ou senha incorretos. Por favor, verifique suas credenciais ou cadastre-se.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9C6D1), // Rosa Pastel
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/cake-cup_logo.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
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
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Color(0xFFF8D0A4)), // Pêssego Claro
                          border: InputBorder.none,
                          icon: Icon(Icons.email, color: Color(0xFFF8D0A4)), // Pêssego Claro
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira seu email';
                          }
                          if (!value.contains('@') || !value.contains('.')) {
                            return 'Por favor, insira um email válido';
                          }
                          return null;
                        },
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
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          labelStyle: TextStyle(color: Color(0xFFF8D0A4)), // Pêssego Claro
                          border: InputBorder.none,
                          icon: Icon(Icons.lock, color: Color(0xFFF8D0A4)), // Pêssego Claro
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira sua senha';
                          }
                          if (value.length < 6) {
                            return 'A senha deve ter pelo menos 6 caracteres';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  _isLoading
                      ? CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFA8D8E8)), // Azul Claro
                        )
                      : Container(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            onPressed: _login,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFA8D8E8), // Azul Claro
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Text(
                              'Entrar',
                              style: TextStyle(
                                color: Color(0xFF333333), // Texto mais escuro para contraste
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => ForgotPassword(),
                      );
                    },
                    child: Text(
                      'Esqueceu a senha?',
                      style: TextStyle(
                        color: Color(0xFFE5C07B), // Dourado Claro
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.go('/cad1');
                    },
                    child: Text(
                      'Não tem uma conta? Cadastre-se',
                      style: TextStyle(
                        color: Color(0xFFE5C07B), // Dourado Claro
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
