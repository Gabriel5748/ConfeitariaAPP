// import 'package:cloud_firestore/cloud_firestore.dart';

// class Usuario {
//   // final String _uid;
//   final String _nome;
//   final String _email;
//   final String _password;

//   Usuario(this._nome, this._email, this._password);

//   Map<String, dynamic> toJson() {
//     return <String, dynamic>{
//       // 'uid': _uid,
//       'nome': _nome,
//       'email': _email,
//       'senha': _password
//     };
//   }

//   factory Usuario.fromJson(Map<String, dynamic> json) {
//     return Usuario(
//       // json['uid'],
//       json['nome'],
//       json['email'],
//       json['senha'],
//     );
//   }

//   Future<void> adicionarUsuario(Usuario usuario) async {
//   try {
//     // Cria uma instância do Firestore
//     final CollectionReference usuarios =
//         FirebaseFirestore.instance.collection('usuarios');

//     // Adiciona o usuário à coleção
//     await usuarios.doc(usuario._uid).set(usuario.toJson());

//     print('Usuário adicionado com sucesso!');
//   } catch (e) {
//     print('Erro ao adicionar usuário: $e');
//   }
// }

//

import 'package:cloud_firestore/cloud_firestore.dart';

class Pedido {
  final String descricao;
  final double valor;
  final DateTime data;

  Pedido({
    required this.descricao,
    required this.valor,
    required this.data,
  });

  Map<String, dynamic> toJson() {
    return {
      'descricao': descricao,
      'valor': valor,
      'data': data.toIso8601String(),
    };
  }

  Future<void> adicionarPedidoAoUsuario(String userId, Pedido pedido) async {
    try {
      // Referência ao documento do usuário dentro da coleção 'usuarios'
      final DocumentReference userDoc =
          FirebaseFirestore.instance.collection('usuarios').doc(userId);

      // Verifica se o documento do usuário existe
      final DocumentSnapshot userSnapshot = await userDoc.get();
      if (!userSnapshot.exists) {
        throw Exception('Usuário não encontrado: $userId');
      }

      // Adiciona o pedido na subcoleção 'pedidos' dentro do documento do usuário
      await userDoc.collection('pedidos').add(pedido.toJson());

      print('Pedido adicionado com sucesso ao usuário $userId');
    } catch (e) {
      print('Erro ao adicionar pedido: $e');
    }
  }
}

class Usuario {
  final String _nome;
  final String _email;
  final String _password;

  Usuario(this._nome, this._email, this._password);

  String get email => _email;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'nome': _nome,
      'email': _email,
      'senha': _password,
    };
  }

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      json['nome'],
      json['email'],
      json['senha'],
    );
  }

// Future<void> adicionarUsuario(Usuario usuario) async {
//   try {
//     // Cria uma instância do Firestore
//     final CollectionReference usuarios =
//         FirebaseFirestore.instance.collection('usuarios');

//     // Verifica se o usuário já existe
//     QuerySnapshot resultado = await usuarios
//         .where('email', isEqualTo: usuario.email) // Substitua 'email' pelo campo único
//         .get();

//     if (resultado.docs.isNotEmpty) {
//       print('Usuário já existe: ${usuario.email}');
//       return; // Sai da função se o usuário já existir
//     }

//     // Adiciona o usuário se não existir
//     final docRef = usuarios.doc(); // Gera um UID automaticamente
//     await docRef.set(usuario.toJson());

//     print('Usuário adicionado com sucesso com UID: ${docRef.id}');
//   } catch (e) {
//     print('Erro ao adicionar usuário: $e');
//   }
// }

}
