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

  // Adiciona um item ao carrinho
  static void adicionarAoCarrinho(MeuCarrinho item) {
    _compras.add(item);
  }

  // Remove um item do carrinho
  static void removerDoCarrinho(MeuCarrinho item) {
    _compras.remove(item);
  }

  // Converte a lista de itens do carrinho para uma lista de JSON
  static List<Map<String, dynamic>> toJsonList() {
    return _compras.map((item) => item.toJson()).toList();
  }

  // Retorna a lista de itens do carrinho
  static List<MeuCarrinho> get compras => _compras;
}
