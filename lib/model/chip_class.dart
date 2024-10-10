//Classe das Categorias dos Doces

class DocesCategoria {
  final String? _categoria;
  final String? _image;
   static late List<DocesCategoria> _listCategorias;
  DocesCategoria({
    String? categoria,
    String? image,
  })  : _categoria = categoria,
        _image = image;

 String? get categoria => _categoria;
 String? get image => _image;

 static void getDados(){
  _listCategorias = [
    DocesCategoria(
      categoria: 'Doces',
      image: 'images/categorias_images/candy.png',
    ),
    DocesCategoria(
      categoria: 'Brigadeiros',
      image: 'images/categorias_images/brigadeiro.png',
    ),
    DocesCategoria(
      categoria: 'Bolos',
      image: 'images/categorias_images/cake-slice.png',
    ),
    DocesCategoria(
      categoria: 'Cupcakes',
      image: 'images/categorias_images/cup-cake.png',
    ),
    DocesCategoria(
      categoria: 'Tortas',
      image: 'images/categorias_images/panna-cotta.png',
    ),
  ];
 }

  List<DocesCategoria> get listCategorias => _listCategorias;
}
