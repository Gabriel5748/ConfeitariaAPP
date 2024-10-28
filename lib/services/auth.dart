import 'dart:js_interop';

import 'package:app_restaurante/model/classes/favorito_class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final FirebaseFirestore firestore = FirebaseFirestore.instance;

void cadastrar(String email, String password) {
  auth.createUserWithEmailAndPassword(email: email, password: password);
}

void login(BuildContext context, String email, String password) {
  auth
      .signInWithEmailAndPassword(email: email, password: password)
      .then((resultado) {
    context.go('/home_page');
  }).catchError((e) {
    switch (e.code) {
      //Tratar erros
    }
  });
}

void resetPassword(String email) {
  auth.sendPasswordResetEmail(email: email).then((resultado) {
    //Pensar no que fazer depois
  });
}

void sendData(BuildContext context, MeusFavoritos favs) {
  firestore
      .collection('Usuarios')
      .add(favs.toJson())
      .then((value) {})
      .whenComplete(() => context.pop());
}

