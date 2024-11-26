// ignore_for_file: use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Auth {
  final FirebaseAuth auth = FirebaseAuth.instance;

  void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void cadastrar(String email, String password) {
    auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> login(
      BuildContext context, String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      context.go('/home_page');
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          showError(context, 'Formato de e-mail inválido.');
          break;
        // case 'user-not-found':
        //   showError(context, 'Usuário não encontrado. Verifique seu e-mail.');
        //   break;
        case 'invalid-credential':
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
          print('FirebaseAuthException code: ${e.code}');

          showError(context, 'Ocorreu um erro inesperado. Tente novamente.');
          break;
      }
    } catch (e) {
      // Lida com outros tipos de exceções que não são FirebaseAuthException
      showError(context, 'Erro inesperado: ${e.toString()}');
    }
  }

  Future<void> logOut(BuildContext context) async {
    try {
      await auth.signOut();
      context.go('/login');
    } catch (e) {
      showError(context, 'Erro ao realizar logout. Tente novamente.');
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      // context.pop();
    } catch (e) {
      // showError(context, e.toString());
    }
  }
}

//Favoritos
// void sendData(context, MeusFavoritos favs) {
//   firestore
//       .collection('Usuarios')
//       .add(favs.toJson())
//       .then((value) {})
//       .whenComplete(() => context.pop());
// }


