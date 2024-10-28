import 'package:cloud_firestore/cloud_firestore.dart';

class DBFirestore{
  //Construtor privado
  DBFirestore._();

  final DBFirestore _instance = DBFirestore._();
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  FirebaseFirestore get(){
    return DBFirestore._()._instance._fireStore;
  }

}