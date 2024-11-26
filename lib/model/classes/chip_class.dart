class DocesCategoria {
  final String? _categoria;
  final String? _image;
  final String? _descricao;
  static late List<DocesCategoria> _listCategorias;

  DocesCategoria({
    String? categoria,
    String? image,
    String? descricao,
  })  : _categoria = categoria,
        _image = image,
        _descricao = descricao;

  String? get categoria => _categoria;
  String? get image => _image;
  String? get descricao => _descricao;
List<DocesCategoria> get listCategorias => _listCategorias;

  static void getDados() {
    _listCategorias = [
      DocesCategoria(
        categoria: 'Doces',
        image: 'images/categorias_images/candy.png',
        descricao: 'Uma seleção de doces variados para adoçar seu dia.',
      ),
      DocesCategoria(
        categoria: 'Brigadeiros',
        image: 'images/categorias_images/brigadeiro.png',
        descricao: 'Clássico doce brasileiro feito de chocolate.',
      ),
      DocesCategoria(
        categoria: 'Bolos',
        image: 'images/categorias_images/cake-slice.png',
        descricao: 'Deliciosos bolos para todos os tipos de celebração.',
      ),
      DocesCategoria(
        categoria: 'Cupcakes',
        image: 'images/categorias_images/cup-cake.png',
        descricao: 'Pequenos bolos decorados e perfeitos para lanches.',
      ),
      DocesCategoria(
        categoria: 'Tortas',
        image: 'images/categorias_images/panna-cotta.png',
        descricao: 'Tortas deliciosas com diferentes sabores e recheios.',
      ),
      DocesCategoria(
        categoria: 'Bebidas',
        image: '/assets/images/chocolate_quente.webp',
        descricao: 'Chocolate quente ótimo para climas frios',
      ),
    ];
  }

   Map<String, dynamic> toJson() {
    return {
      'categoria': _categoria,
      'image': _image,
      'desc': _descricao,
    };
  }

   static List<Map<String, dynamic>> toJsonList() {
    return _listCategorias.map((doce) => doce.toJson()).toList();
  }
}
