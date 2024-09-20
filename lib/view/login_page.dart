import 'package:app_restaurante/model/inputfield.dart';
import 'package:app_restaurante/utils/navigators.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  bool isChecked = false;

  void submitForm() {
    if (formKey.currentState!.validate()) {
      // Aqui você pode enviar os dados para o banco de dados ou outra ação
      print('Formulário enviado com sucesso!');
    } else {
      print('Formulário inválido');
    }
  }

  void toggleCheckBox() {
    setState(() {
      isChecked = !isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'images/bolinho.png',
                  width: 200,
                  height: 200,
                ),
                const Text('Os melhores doces estão aqui, esperando por você'),
                ...inputField.map((e) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    child: e,
                  );
                }).toList(),
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
                        onPressed: () {},
                        child: const Text(
                          'Forgot password ?',
                        ))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () => Navigate.homePage(context),
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
                    TextButton(onPressed: () => Navigate.cadastroPage(context), child: const Text('Sign up'))
                  ],
                ),
                const Divider()
              ]),
        ),
      ),
    );
  }
}
