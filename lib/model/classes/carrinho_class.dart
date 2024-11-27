class MeuCarrinho {
  final String _nome;
  final String _image;
  final double _preco;
  int quantidade;

  static final List<MeuCarrinho> _compras = [];

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

  // Converte o objeto para JSON
  Map<String, dynamic> toJson() {
    return {
      'nome': _nome,
      'image': _image,
      'preco': _preco,
      'quantidade': quantidade,
    };
  }

  // Retorna os itens
  static List<MeuCarrinho> get compras => _compras;
}
