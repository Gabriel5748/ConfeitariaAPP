import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/classes/user_class.dart';

//Arquivo responsavel por tratar do firebase store

class AuthDB {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//Melhorar depois

  Future<void> adicionarUsuario(Usuario usuario) async {
    try {
      // Cria uma instância do Firestore
      final CollectionReference usuarios =
          FirebaseFirestore.instance.collection('usuarios');

      // Verifica se o usuário já existe
      QuerySnapshot resultado = await usuarios
          .where('email',
              isEqualTo: usuario.email)
          .get();

      if (resultado.docs.isNotEmpty) {
        print('Usuário já existe: ${usuario.email}');
        return;
      }

      final docRef = usuarios.doc();
      await docRef.set(usuario.toJson());

      print('Usuário adicionado com sucesso com UID: ${docRef.id}');
    } catch (e) {
      print('Erro ao adicionar usuário: $e');
    }
  }

  String? getUserId() {
    final User? user = FirebaseAuth.instance.currentUser;
    return user?.uid;
  }

  Future<void> adicionarItensCategoria(List<Map<String, dynamic>> itens) async {
    CollectionReference categorias = _firestore.collection('categorias');

    for (var item in itens) {
      try {
        QuerySnapshot querySnapshot = await categorias
            .where('categoria', isEqualTo: item['categoria'])
            .get();

        if (querySnapshot.docs.isEmpty) {
          await categorias.add(item);
          print("Item adicionado: ${item['nome']}");
        } else {
          print("Item já existe: ${item['nome']}");
        }
      } catch (e) {
        print("Erro ao adicionar item: $e");
      }
    }
  }

  Future<void> adicionarItensCardapio(List<Map<String, dynamic>> itens) async {
    CollectionReference cardapio = _firestore.collection('itens_cardapio');

    for (var item in itens) {
      try {
        QuerySnapshot querySnapshot =
            await cardapio.where('nome', isEqualTo: item['nome']).get();

        if (querySnapshot.docs.isEmpty) {
          await cardapio.add(item);
          print("Item adicionado: ${item['nome']}");
        } else {
          print("Item já existe: ${item['nome']}");
        }
      } catch (e) {
        print("Erro ao adicionar item: $e");
      }
    }
  }

  //Ver com o Plotz amanhã

  Future<void> adicionarUsuarioPedido(
      List<Map<String, dynamic>> pedidos) async {
    try {
      final User? user = _auth.currentUser;

      if (user == null) {
        print('Erro: Usuário não autenticado.');
        return;
        
      }

      final String uid = user.uid;

      DocumentReference usuarioDoc = _firestore.collection('usuarios').doc(uid);

      DocumentSnapshot usuarioSnapshot = await usuarioDoc.get();

      if (!usuarioSnapshot.exists) {
        await usuarioDoc.set({'criadoEm': FieldValue.serverTimestamp()});
      }

      for (var pedido in pedidos) {
        await usuarioDoc.collection('pedidos').add(pedido);
      }

      print('Pedidos adicionados com sucesso para o usuário: $uid');
    } catch (e) {
      print('Erro ao adicionar pedidos: $e');
    }
  }
}
