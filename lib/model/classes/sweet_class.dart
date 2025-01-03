// ---Os  doces ficarão aqui---

class Doces {
  final String _image;
  final String? _nome;
  final String? _desc;
  final double _preco;
  final int _quantidade;
  final String? _categoria;
  final double? _rating;
  static List<Doces> _docesList = [];

  Doces(
      {required String image,
      String? nome,
      String? desc,
      required double preco,
      required int quantidade,
      String? categoria,
      double? rating})
      : _image = image,
        _nome = nome,
        _desc = desc,
        _preco = preco,
        _quantidade = 1,
        _categoria = categoria,
        _rating = rating;

  static void getDados() {
    _docesList = [
      Doces(
          image: "assets/images/alfajor.webp",
          nome: "Alfajor",
          desc:
              "Doce tradicional argentino feito de duas camadas de massa com recheio de doce de leite e cobertura de chocolate",
          preco: 5.50,
          quantidade: 1,
          categoria: "Doces",
          rating: 4.0),
      Doces(
          image: "assets/images/bem_casado.webp",
          nome: "Bem Casado",
          desc:
              "Doce de massa macia recheado com doce de leite, tradicional em casamentos",
          preco: 4.00,
          quantidade: 1,
          categoria: "Doces",
          rating: 3.0),
      Doces(
          image: "assets/images/brownie.webp",
          nome: "Brownie",
          desc:
              "Delicioso bolo de chocolate, úmido por dentro e com uma leve crocância por fora",
          preco: 6.00,
          quantidade: 1,
          categoria: "Bolos",
          rating: 5.0),
      Doces(
          image: "assets/images/torta_holandesa.webp",
          nome: "Torta Holandesa",
          desc:
              "Sobremesa gelada com base de biscoito e cobertura de chocolate",
          preco: 8,
          quantidade: 1,
          categoria: "Tortas",
          rating: 4.5),
      Doces(
          image: "assets/images/pudim.webp",
          nome: "Pudim",
          desc: "Clássico pudim de leite condensado com calda de caramelo",
          preco: 7.00,
          quantidade: 1,
          categoria: "Doces",
          rating: 3.5),
      Doces(
          image: "assets/images/cupcake.webp",
          nome: "Cupcake",
          desc:
              "Mini bolo recheado e decorado com cobertura, perfeito para qualquer ocasião",
          preco: 3.50,
          quantidade: 1,
          categoria: "Cupcakes",
          rating: 5.0),
      Doces(
          image: "assets/images/torta_alema.webp",
          nome: "Torta Alemã",
          desc: "Torta gelada de creme, biscoitos e cobertura de chocolate",
          preco: 8.50,
          quantidade: 1,
          categoria: "Tortas",
          rating: 3.0),
      Doces(
          image: "assets/images/bombocado.webp",
          nome: "Bombocado",
          desc: "Pequeno doce de coco com uma textura macia e sabor delicioso",
          preco: 2.50,
          quantidade: 1,
          categoria: "Doces",
          rating: 2.5),
      Doces(
          image: "assets/images/chocolate_quente.webp",
          nome: "Chocolate Quente",
          desc: "Bebida quente e cremosa feita com chocolate derretido e leite",
          preco: 5.00,
          quantidade: 1,
          categoria: "Bebidas",
          rating: 5),
      Doces(
          image: "assets/images/chezzcake.webp",
          nome: "Cheesecake",
          desc:
              "Cheesecake suave e cremoso com cobertura de cerejas frescas e calda brilhante, servido sobre uma base crocante de biscoito",
          preco: 3.00,
          quantidade: 1,
          categoria: "Tortas",
          rating: 4.5),
    ];
  }

  Map<String, dynamic> toJson() {
    return {
      'image': _image,
      'nome': _nome,
      'desc': _desc,
      'preco': _preco,
      'quantidade': _quantidade,
      'categoria': _categoria,
      'rating': _rating,
    };
  }

  static List<Map<String, dynamic>> toJsonList() {
    return _docesList.map((doce) => doce.toJson()).toList();
  }

  List<Doces> get docesList => _docesList;

  String get image => _image;
  String? get nome => _nome;
  String? get desc => _desc;
  double get preco => _preco;
  int get quantidade => _quantidade;
  String? get categoria => _categoria;
  double? get rating => _rating;
}
