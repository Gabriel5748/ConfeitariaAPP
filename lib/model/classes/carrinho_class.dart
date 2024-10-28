class MeuCarrinho {
  final String _nome;
  final String _image;
  final double _preco;
  late int quantidade;

  MeuCarrinho({
    required String nome,
    required String image,
    required double preco,
    required this.quantidade,
  })  : _nome = nome,
        _image = image,
        _preco = preco;

  String get nome => _nome;
  String get image => _image;
  double get preco => _preco;

  
}
