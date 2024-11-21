import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth{


final FirebaseAuth auth = FirebaseAuth.instance;
final FirebaseFirestore firestore = FirebaseFirestore.instance;

void showError(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}


void cadastrar(String email, String password) {
  auth.createUserWithEmailAndPassword(email: email, password: password);
}

void login(context, String email, String password) {
  auth.signInWithEmailAndPassword(email: email, password: password).then((resultado) {
    context.go('/home_page');
  }).catchError((e) {
    switch (e.code) {
      case 'invalid-email':
        showError(context, 'Formato de e-mail inválido.');
        break;
      case 'user-not-found':
        showError(context, 'Usuário não encontrado. Verifique seu e-mail.');
        break;
      case 'wrong-password':
        showError(context, 'Senha incorreta. Tente novamente.');
        break;
      case 'user-disabled':
        showError(context, 'Esta conta foi desativada.');
        break;
      case 'too-many-requests':
        showError(context, 'Muitas tentativas. Aguarde e tente novamente.');
        break;
      case 'network-request-failed':
        showError(context, 'Falha na conexão. Verifique sua internet.');
        break;
      case 'operation-not-allowed':
        showError(context, 'Login com e-mail e senha está desabilitado.');
        break;
      default:
        showError(context, 'Ocorreu um erro inesperado. Tente novamente.');
        break;
    }
  });
}

void logOut(context) {
  auth.signOut().then((value) => context.go('/login'));
}

void resetPassword(String email) {
  auth.sendPasswordResetEmail(email: email).then((resultado) {
    //Pensar no que fazer depois
  });
}

//Favoritos
// void sendData(context, MeusFavoritos favs) {
//   firestore
//       .collection('Usuarios')
//       .add(favs.toJson())
//       .then((value) {})
//       .whenComplete(() => context.pop());
// }

}
