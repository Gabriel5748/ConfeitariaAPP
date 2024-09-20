// ---Os  doces ficarão aqui---
class Doces {
  final String? _image;
  final String? _nome;
  final String? _desc;
  final double? _preco;
  final String? _categoria;
  final List<Doces> _doces = [];

  Doces(
      {String? image,
      String? nome,
      String? desc,
      double? preco,
      String? categoria})
      : _image = image,
        _nome = nome,
        _desc = desc,
        _preco = preco,
        _categoria = categoria;

  String? get image => _image;
  String? get nome => _nome;
  String? get desc => _desc;
  double? get preco => _preco;
  String? get categoria => _categoria;
  List<Doces>? get docesList => _doces;

  void getDados() {
    _doces.add(Doces(
        image: "assets/images/brigadeiro.png",
        nome: "Brigadeiro",
        desc: "Doce tradicional brasileiro",
        preco: 1.50,
        categoria: "Chocolate"));

    _doces.add(Doces(
        image: "assets/images/beijinho.png",
        nome: "Beijinho",
        desc: "Doce de coco com leite condensado",
        preco: 1.50,
        categoria: "Coco"));

    _doces.add(Doces(
        image: "assets/images/cajuzinho.png",
        nome: "Cajuzinho",
        desc: "Doce de amendoim",
        preco: 1.50,
        categoria: "Amendoim"));

    _doces.add(Doces(
        image: "assets/images/bolo.png",
        nome: "Bolo de Cenoura",
        desc: "Bolo de cenoura com cobertura de chocolate",
        preco: 15.00,
        categoria: "Bolos"));

    _doces.add(Doces(
        image: "assets/images/quindim.png",
        nome: "Quindim",
        desc: "Doce de gema de ovo e coco",
        preco: 3.00,
        categoria: "Coco"));

    _doces.add(Doces(
        image: "assets/images/pudim.png",
        nome: "Pudim de Leite",
        desc: "Pudim clássico de leite condensado",
        preco: 4.00,
        categoria: "Sobremesa"));

    _doces.add(Doces(
        image: "assets/images/pastel.png",
        nome: "Pastel de Belém",
        desc: "Pastel tradicional português",
        preco: 5.00,
        categoria: "Sobremesa"));

    _doces.add(Doces(
        image: "assets/images/alfajor.png",
        nome: "Alfajor",
        desc: "Doce argentino recheado com doce de leite",
        preco: 7.00,
        categoria: "Chocolate"));

    _doces.add(Doces(
        image: "assets/images/torta.png",
        nome: "Torta Holandesa",
        desc: "Torta de creme com biscoito",
        preco: 12.00,
        categoria: "Torta"));

    _doces.add(Doces(
        image: "assets/images/sorvete.png",
        nome: "Sorvete de Chocolate",
        desc: "Sorvete de chocolate artesanal",
        preco: 6.00,
        categoria: "Sobremesa"));
  }
}
