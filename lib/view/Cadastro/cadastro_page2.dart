import 'package:app_restaurante/model/validators.dart';
import 'package:app_restaurante/services/auth.dart';
import 'package:app_restaurante/utils/navigators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        // Navigate.cadastroPage3(context);
      }
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 173, 240),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Seja bem vindo + nome da pessoa'),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Crie uma conta',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '2/5',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w800),
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: TextFormField(
                  validator: (value) => ValidateEmail.validate(value!),
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Enter your email address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: TextFormField(
                  controller: pass1Controller,
                  validator: (value) => ValidatePassword.validate(value!),
                  onChanged: (value) => ValidatePassword.validate(value),
                  decoration: InputDecoration(
                    hintText: 'Create a password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: TextFormField(
                  controller: pass2Controller,
                  validator: (value) => ValidatePassword.confirmPassword(
                      pass1Controller.text, pass2Controller.text),
                  decoration: InputDecoration(
                    hintText: 'Confirm your password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              OutlinedButton(
                  onPressed: () {
                    setData(emailController.text, pass1Controller.text);
                    if (formKey.currentState!.validate()) {
                      cadastrar(emailController.text, pass1Controller.text);
                      Navigate.cadastroPage3(context);
                    }
                  },
                  child: const Icon(
                    CupertinoIcons.arrow_right_square_fill,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
