class MeusFavoritos {
  final String _uid;
  final String _nome;
  final String _image;

  
  MeusFavoritos(this._uid,this._nome,this._image);

  // MeusFavoritos({
  //   required String uid,
  //   required String nome,
  //   required String image,
  // })  : _uid = uid,
  //       _nome = nome,
  //       _image = image;

  String get nome => _nome;
  String get image => _image;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': _uid,
      'nome': _nome,
      'imagem': _image
    };
  }

  factory MeusFavoritos.fromJson(Map<String, dynamic> json) {
    return MeusFavoritos(
      json['uid'],
      json['titulo'],
      json['descricao'],
    );
  }
}
