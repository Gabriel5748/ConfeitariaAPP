import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {
  final String _uid;
  final String _nome;
  final String _email;
  final String _password;

  Usuario(this._uid, this._nome, this._email, this._password);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': _uid,
      'nome': _nome,
      'email': _email,
      'senha': _password
    };
  }

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      json['uid'],
      json['nome'],
      json['email'],
      json['senha'],
    );
  }

  Future<void> adicionarUsuario(Usuario usuario) async {
  try {
    // Cria uma instância do Firestore
    final CollectionReference usuarios =
        FirebaseFirestore.instance.collection('usuarios');

    // Adiciona o usuário à coleção
    await usuarios.doc(usuario._uid).set(usuario.toJson());

    print('Usuário adicionado com sucesso!');
  } catch (e) {
    print('Erro ao adicionar usuário: $e');
  }
}

}