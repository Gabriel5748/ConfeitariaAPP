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
      QuerySnapshot resultado =
          await usuarios.where('email', isEqualTo: usuario.email).get();

      if (resultado.docs.isNotEmpty) {
        print('Usuário já existe: ${usuario.email}');
        return;
      }

      final docRef = usuarios.doc();
      print(docRef);
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

    final String email = user.email ?? ''; // Usa o e-mail do usuário para buscar o documento

    // Consulta para encontrar o documento do usuário baseado no e-mail
    QuerySnapshot querySnapshot = await _firestore
        .collection('usuarios')
        .where('email', isEqualTo: email)
        .get();

    if (querySnapshot.docs.isEmpty) {
      print('Erro: Documento do usuário não encontrado.');
      return;
    }

    // Obtém o primeiro documento encontrado (assumindo que o e-mail seja único)
    DocumentSnapshot usuarioSnapshot = querySnapshot.docs.first;

    // Referência para a subcoleção "pedidos"
    CollectionReference pedidosRef =
        usuarioSnapshot.reference.collection('pedidos');

    // Adiciona cada pedido como um documento separado na subcoleção
    for (Map<String, dynamic> pedido in pedidos) {
      await pedidosRef.add(pedido);
    }

    print(
        'Pedidos adicionados na subcoleção "pedidos" para o documento com ID: ${usuarioSnapshot.id}');
  } catch (e) {
    print('Erro ao adicionar pedidos: $e');
  }
}

Future<void> excluirPedidoPorCriterio(String criterio) async {
  try {
    final User? user = _auth.currentUser;

    if (user == null) {
      print('Erro: Usuário não autenticado.');
      return;
    }

    final String email = user.email ?? '';

    QuerySnapshot querySnapshot = await _firestore
        .collection('usuarios')
        .where('email', isEqualTo: email)
        .get();

    if (querySnapshot.docs.isEmpty) {
      print('Erro: Documento do usuário não encontrado.');
      return;
    }

    DocumentSnapshot usuarioSnapshot = querySnapshot.docs.first;

    CollectionReference pedidosRef =
        usuarioSnapshot.reference.collection('pedidos');

    // Consulta para encontrar pedidos que correspondam ao critério
    QuerySnapshot pedidosSnapshot = await pedidosRef
        .where('nome', isEqualTo: criterio)
        .get();

    if (pedidosSnapshot.docs.isEmpty) {
      print('Erro: Pedido não encontrado.');
      return;
    }

    // Exclui os pedidos encontrados
    for (DocumentSnapshot pedido in pedidosSnapshot.docs) {
      await pedido.reference.delete();
      print('Pedido com ID ${pedido.id} excluído.');
    }
  } catch (e) {
    print('Erro ao excluir pedido: $e');
  }
}


}
