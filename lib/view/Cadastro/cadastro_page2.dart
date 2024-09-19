import 'package:app_restaurante/utils/navigators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CadastroPage2 extends StatelessWidget {
  const CadastroPage2({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your email address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                 hintText: 'Create a password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Confirm your password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            OutlinedButton(
                onPressed: () => Navigate.cadastroPage3(context),
                child: const Icon(
                  CupertinoIcons.arrow_right_square_fill,
                ))
          ],
        ),
      ),
    );
  }
}
