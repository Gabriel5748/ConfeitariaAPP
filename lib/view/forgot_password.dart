import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    return AlertDialog(
      title: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              'Esqueceu a senha ?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            right: -8,
            top: -8,
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
      content: SizedBox(
        height: 250,
        width: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(CupertinoIcons.mail, size: 60, color: Color(0xffC77DFF)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffC77DFF).withOpacity(0.2),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Icon(CupertinoIcons.envelope),
                  ),
                  prefixIconColor: Colors.black,
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 200,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  // Removendo chamada ao Firebase
                  // Auth().resetPassword(emailController.text);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffC77DFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  'Enviar',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
