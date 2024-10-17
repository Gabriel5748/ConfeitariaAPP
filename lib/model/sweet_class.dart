// ---Os  doces ficarão aqui---
class Doces {
  final String? _image;
  final String? _nome;
  final String? _desc;
  final String? _preco;
  String? _quantidade;
  final String? _categoria;
  final double? _rating;
  static List<Doces> _docesList = [];

  Doces(
      {String? image,
      String? nome,
      String? desc,
      String? preco,
      String? quantidade,
      String? categoria,
      double? rating})
      : _image = image,
        _nome = nome,
        _desc = desc,
        _preco = preco,
        _quantidade = '1',
        _categoria = categoria,
        _rating = rating;

  String? get image => _image;
  String? get nome => _nome;
  String? get desc => _desc;
  String? get preco => _preco;
  String get quantidade => _quantidade ?? '1';
  String? get categoria => _categoria;
  double? get rating => _rating;

  static void getDados() {
    _docesList = [
      Doces(
          image: "images/alfajor.webp",
          nome: "Alfajor",
          desc:
              "Doce tradicional argentino feito de duas camadas de massa com recheio de doce de leite e cobertura de chocolate",
          preco: '5.50',
          quantidade: "1",
          categoria: "Doce",
          rating: 4.0),
      Doces(
          image: "images/bem_casado.webp",
          nome: "Bem Casado",
          desc:
              "Doce de massa macia recheado com doce de leite, tradicional em casamentos",
          preco: '4.00',
          quantidade: "1",
          categoria: "Doce",
          rating: 3.0),
      Doces(
          image: "images/brownie.webp",
          nome: "Brownie",
          desc:
              "Delicioso bolo de chocolate, úmido por dentro e com uma leve crocância por fora",
          preco: '6.00',
          quantidade: "1",
          categoria: "Doce",
          rating: 5.0),
      Doces(
          image: "images/torta_holandesa.webp",
          nome: "Torta Holandesa",
          desc:
              "Sobremesa gelada com base de biscoito e cobertura de chocolate",
          preco: '8.00',
          quantidade: "1",
          categoria: "Torta",
          rating: 4.5),
      Doces(
          image: "images/pudim.webp",
          nome: "Pudim",
          desc: "Clássico pudim de leite condensado com calda de caramelo",
          preco: '7.00',
          quantidade: "1",
          categoria: "Doce",
          rating: 3.5),
      Doces(
          image: "images/cupcake.webp",
          nome: "Cupcake",
          desc:
              "Mini bolo recheado e decorado com cobertura, perfeito para qualquer ocasião",
          preco: '3.50',
          quantidade: "1",
          categoria: "Doce",
          rating: 5.0),
      Doces(
          image: "images/torta_alema.webp",
          nome: "Torta Alemã",
          desc: "Torta gelada de creme, biscoitos e cobertura de chocolate",
          preco: '8.50',
          quantidade: "1",
          categoria: "Torta",
          rating: 3.0),
      Doces(
          image: "images/bombocado.webp",
          nome: "Bombocado",
          desc: "Pequeno doce de coco com uma textura macia e sabor delicioso",
          preco: '2.50',
          quantidade: "1",
          categoria: "Doce",
          rating: 2.5),
      Doces(
          image: "images/chocolate_quente.webp",
          nome: "Chocolate Quente",
          desc: "Bebida quente e cremosa feita com chocolate derretido e leite",
          preco: '5.00',
          quantidade: "1",
          categoria: "Bebida",
          rating: 5),
      Doces(
          image: "images/chezzcake.webp",
          nome: "Cheesecake",
          desc:
              "Cheesecake suave e cremoso com cobertura de cerejas frescas e calda brilhante, servido sobre uma base crocante de biscoito",
          preco: '3.00',
          quantidade: "1",
          categoria: "Doce",
          rating: 4.5),
    ];
  }

  List<Doces> get docesList => _docesList;

  set quantidade(String valor) {
    _quantidade = valor;
  }
}
