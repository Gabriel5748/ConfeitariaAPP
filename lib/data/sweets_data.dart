// ---Os  doces ficarão aqui---
class Doces {
  final String? _image;
  final String? _nome;
  final String? _desc;
  final String? _preco;
  final String? _categoria;
  final double? _rating;
  static List<Doces> _docesList = [];

  Doces(
      {String? image,
      String? nome,
      String? desc,
      String? preco,
      String? categoria,
      double? rating})
      : _image = image,
        _nome = nome,
        _desc = desc,
        _preco = preco,
        _categoria = categoria,
        _rating = rating;

  String? get image => _image;
  String? get nome => _nome;
  String? get desc => _desc;
  String? get preco => _preco;
  String? get categoria => _categoria;
  double? get rating => _rating;

  static void getDados() {
    _docesList = [
      Doces(
          image: "imagem_alfajor.png",
          nome: "Alfajor",
          desc:
              "Doce tradicional argentino feito de duas camadas de massa com recheio de doce de leite e cobertura de chocolate.",
          preco: '5.50',
          categoria: "Doce",
          rating: 4.0),
      Doces(
          image: "imagem_bem_casado.png",
          nome: "Bem Casado",
          desc:
              "Doce de massa macia recheado com doce de leite, tradicional em casamentos.",
          preco: '4.00',
          categoria: "Doce",
          rating: 3.0),
      Doces(
          image: "imagem_brownie.png",
          nome: "Brownie",
          desc:
              "Delicioso bolo de chocolate, úmido por dentro e com uma leve crocância por fora.",
          preco: '6.00',
          categoria: "Doce",
          rating: 5.0),
      Doces(
          image: "imagem_torta_holandesa.png",
          nome: "Torta Holandesa",
          desc:
              "Sobremesa gelada com base de biscoito e cobertura de chocolate.",
          preco: '8.00',
          categoria: "Torta",
          rating: 4.5),
      Doces(
          image: "imagem_pudim.png",
          nome: "Pudim",
          desc: "Clássico pudim de leite condensado com calda de caramelo.",
          preco: '7.00',
          categoria: "Doce",
          rating: 3.5),
      Doces(
          image: "imagem_cupcake.png",
          nome: "Cupcake",
          desc:
              "Mini bolo recheado e decorado com cobertura, perfeito para qualquer ocasião.",
          preco: '3.50',
          categoria: "Doce",
          rating: 5.0),
      Doces(
          image: "imagem_torta_alema.png",
          nome: "Torta Alemã",
          desc: "Torta gelada de creme, biscoitos e cobertura de chocolate.",
          preco: '8.50',
          categoria: "Torta",
          rating: 3.0),
      Doces(
          image: "imagem_bombocado.png",
          nome: "Bombocado",
          desc: "Pequeno doce de coco com uma textura macia e sabor delicioso.",
          preco: '2.50',
          categoria: "Doce",
          rating: 2.5),
      Doces(
          image: "imagem_chocolate_quente.png",
          nome: "Chocolate Quente",
          desc:
              "Bebida quente e cremosa feita com chocolate derretido e leite.",
          preco: '5.00',
          categoria: "Bebida",
          rating: 5),
      Doces(
          image: "imagem_cookies.png",
          nome: "Cookies",
          desc:
              "Biscoitos crocantes por fora e macios por dentro, com gotas de chocolate.",
          preco: '3.00',
          categoria: "Doce",
          rating: 4.5),
    ];
  }

  List<Doces> get docesList => _docesList;
}
