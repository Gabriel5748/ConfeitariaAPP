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

class Pedido {
  final String nome;
  final String image;
  final double preco;
  final int quantidade;
  final DateTime dataHora;

  Pedido({
    required this.nome,
    required this.image,
    required this.preco,
    required this.quantidade,
    required this.dataHora,
  });

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'image': image,
      'preco': preco,
      'quantidade': quantidade,
      'dataHora': dataHora.toIso8601String(),
    };
  }

  factory Pedido.fromJson(Map<String, dynamic> json) {
    return Pedido(
      nome: json['nome'],
      image: json['image'],
      preco: json['preco'],
      quantidade: json['quantidade'],
      dataHora: DateTime.parse(json['dataHora']),
    );
  }
}

class User {
  final String id;
  final String nome;
  final String email;
  final String senha;
  final List<Pedido> pedidos;

  User({
    required this.id,
    required this.nome,
    required this.email,
    required this.senha,
    required this.pedidos,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'senha': senha,
      'pedidos': pedidos.map((pedido) => pedido.toJson()).toList(),
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      nome: json['nome'],
      email: json['email'],
      senha: json['senha'],
      pedidos: (json['pedidos'] as List)
          .map((pedido) => Pedido.fromJson(pedido))
          .toList(),
    );
  }
}
