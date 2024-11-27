// ignore_for_file: prefer_const_constructors

import 'package:app_restaurante/model/classes/chip_class.dart';
import 'package:app_restaurante/services/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../model/classes/sweet_class.dart';
import '../model/classes/user_class.dart';
import '../services/auth.dart';
import '../services/auth_db.dart';
import 'forgot_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isChecked = false;
  late final List<Doces> listaDoces;
  String errorMessage = '';

  void toggleCheckBox() {
    setState(() {
      isChecked = !isChecked;
    });
  }

  void enterApp() {
    if (formKey.currentState!.validate()) {
      Auth().login(context, emailController.text, passwordController.text);
    }
  }

  @override
  void initState() {
    Doces.getDados();
    List<Map<String, dynamic>> docesJson = Doces.toJsonList();
    DocesCategoria.getDados();
    List<Map<String, dynamic>> categoriasJson = DocesCategoria.toJsonList();

    AuthDB().adicionarItensCardapio(docesJson);
    AuthDB().adicionarItensCategoria(categoriasJson);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 173, 240),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Consumer<UserData>(
            builder: ((context, user, child) {
              emailController.text = user.email;
              passwordController.text = user.password;
              return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Image.asset(
                        'assets/images/cake-cup_logo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Text(
                        'Os melhores doces estão aqui, esperando por você!'),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                      child: TextFormField(
                        // validator: (value) {
                        //   if (user.email != value) {
                        //     return 'Email e/ou senha inválido';
                        //   }
                        // },
                        controller: emailController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffC77DFF),
                          prefixIcon: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: Icon(CupertinoIcons.envelope),
                          ),
                          prefixIconColor: Colors.black,
                          hintText: 'Enter your email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                      child: TextFormField(
                        // validator: (value) {
                        //   if (user.password != value) {
                        //     return 'Email e/ou senha inválido';
                        //   }
                        //   return null;
                        // },
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffC77DFF),
                          prefixIcon: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: Icon(CupertinoIcons.padlock),
                          ),
                          prefixIconColor: Colors.black,
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(CupertinoIcons.eye_slash)),
                          suffixIconColor: Colors.black,
                          hintText: 'Enter your password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: CheckboxListTile(
                            title: const Text('Remember me'),
                            value: isChecked,
                            onChanged: (value) => toggleCheckBox(),
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => ForgotPassword());
                            },
                            child: const Text(
                              'Forgot password ?',
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // final usuario = Usuario('2', user.username, emailController.text,
                        //     passwordController.text);
                        final usuario = Usuario(user.username,
                            emailController.text, passwordController.text);
                        // usuario.adicionarUsuario(usuario);
                        AuthDB().adicionarUsuario(usuario);
                        // AuthDB().sendUserData(usuario.toJson());
                        enterApp();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          fixedSize: const Size(300, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('Dont have an account ?'),
                        TextButton(
                            onPressed: () => context.go('/cadastro'),
                            child: const Text('Sign up'))
                      ],
                    ),
                    const Divider()
                  ]);
            }),
          ),
        ),
      ),
    );
  }
}
