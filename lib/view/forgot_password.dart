import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/auth.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    return AlertDialog(
      title: Text(
        'Esqueceu a senha ?',
        textAlign: TextAlign.center,
      ),
      content: SizedBox(
        height: 200,
        width: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(CupertinoIcons.mail,size: 50,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffC77DFF),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
            ElevatedButton(
                onPressed: () {
                  Auth().resetPassword(emailController.text);
                },
                child: Text('Enviar'))
          ],
        ),
      ),
    );
  }
}
